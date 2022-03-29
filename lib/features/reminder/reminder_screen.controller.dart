import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remindersapp/features/reminder/reminder_screen.state.dart';
import 'package:remindersapp/model/model.dart';
import 'package:remindersapp/services/reminder_service.dart';

/* 
DATA PROVIDERS
*/

final reminderDataProvider =
    FutureProvider.family<Reminder, String>((ref, reminderId) {
  return ReminderService().getReminder(reminderId).first;
});

/*
  STATE NOTIFIER PROVIDER
*/
final reminderScreenStateNotifierProvider = StateNotifierProvider.autoDispose
    .family<ReminderScreenStateNotifier, ReminderScreenState, String?>(
        (ref, reminderId) {
  //UPDATE //If the reminder ID is not null, set the reminder from the data provider
  if (reminderId != null) {
    return ReminderScreenStateNotifier(
      ReminderScreenState(
        reminder: ref.watch(reminderDataProvider(reminderId)),
        isCreation: false,
      ),
    );
  } else {
    //CREATION //If the reminder ID is null, get state it from a new reminder
    return ReminderScreenStateNotifier(ReminderScreenState(
      reminder: AsyncData(Reminder.empty()),
      isCreation: true,
    ));
  }
});

/*
  STATE NOTIFIER (CONTROLLER)
*/
class ReminderScreenStateNotifier extends StateNotifier<ReminderScreenState> {
  ReminderScreenStateNotifier(ReminderScreenState state) : super(state);

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
