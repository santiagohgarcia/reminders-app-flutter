import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remindersapp/features/reminder/reminder_screen.state.dart';
import 'package:remindersapp/general_providers.dart';
import 'package:remindersapp/model/model.dart';
import 'package:remindersapp/services/reminder_service.dart';

/*
  STATE NOTIFIER PROVIDER
*/
final reminderStateNotifierProvider = StateNotifierProvider.autoDispose
    .family<ReminderScreenStateNotifier, ReminderScreenState, String?>(
        (ref, reminderId) {
  //If the reminder ID is not null, load the reminder and set it to state
  if (reminderId != null) {
    return ReminderScreenStateNotifier.fromReminderId(reminderId);
  } else {
    //If the reminder ID is null, get state it from a new reminder
    final user = ref.watch(userProvider);
    return ReminderScreenStateNotifier.fromEmptyReminder(user.value!.uid);
  }
});

/*
  STATE NOTIFIER (CONTROLLER)
*/
class ReminderScreenStateNotifier extends StateNotifier<ReminderScreenState> {
  ReminderScreenStateNotifier(ReminderScreenState state) : super(state);

  static ReminderScreenStateNotifier fromEmptyReminder(String userId) {
    final emptyState = ReminderScreenState(
        reminder: AsyncData(Reminder.empty(userId)), isCreation: true);
    return ReminderScreenStateNotifier(emptyState);
  }

  static ReminderScreenStateNotifier fromReminderId(String reminderId) {
    final reminderScreenStateNotifier =
        ReminderScreenStateNotifier(const ReminderScreenState(
      reminder: AsyncLoading(),
      isCreation: false
    ));
    reminderScreenStateNotifier.loadReminderById(reminderId);
    return reminderScreenStateNotifier;
  }

  Future<void> loadReminderById(String reminderId) {
    state = state.copyWith(reminder: const AsyncLoading());
    return ReminderService().getReminder(reminderId).first.then((reminder) {
      state = state.copyWith(reminder: AsyncData(reminder));
      return reminder;
    }).catchError((e, s) {
      state = state.copyWith(reminder: AsyncError(e, stackTrace: s));
    });
  }

  void setDescription(String description) {
    final reminder = state.reminder.value!;
    state = state.copyWith(
        reminder: AsyncData(reminder.copyWith(description: description)));
  }

  void setDatetime(DateTime datetime) {
    final reminder = state.reminder.value!;
    state = state.copyWith(
        reminder: AsyncData(reminder.copyWith(datetime: datetime)));
  }

  Future<void> save() async {
    final reminder = state.reminder.value!;
    //CREATION
    if (state.isCreation) {
      return ReminderService().createReminder(reminder);
      //EDITION
    } else {
      return ReminderService().updateReminder(reminder);
    }
  }

  Future<void> delete() async {
    final reminder = state.reminder.value!;
    return ReminderService().deleteReminder(reminder.id!);
  }
}
