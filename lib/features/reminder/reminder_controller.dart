import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remindersapp/general_providers.dart';
import 'package:remindersapp/model/model.dart';
import 'package:remindersapp/services/reminder_service.dart';

/*
  STATE NOTIFIER (PROVIDER)
*/
final reminderNotifierProvider = StateNotifierProvider.autoDispose
    .family<ReminderController, AsyncValue<Reminder>, String?>(
        (ref, reminderId) {
  //If the reminder ID is not null, load the reminder and set it to state
  if (reminderId != null) {
    return ReminderController.fromReminderId(reminderId);
  } else {
    //If the reminder ID is null, get state it from a new reminder
    final user = ref.watch(userProvider);
    return ReminderController.fromEmptyReminder(user.value!.uid);
  }
});

/*
  STATE NOTIFIER (CONTROLLER)
*/
class ReminderController extends StateNotifier<AsyncValue<Reminder>> {
  ReminderController(AsyncValue<Reminder> reminderAsync) : super(reminderAsync);

  static ReminderController fromEmptyReminder(String userId) {
    return ReminderController(AsyncData(Reminder.empty(userId)));
  }

  static ReminderController fromReminderId(String reminderId) {
    final reminderController = ReminderController(const AsyncLoading());
    reminderController.loadReminderById(reminderId);
    return reminderController;
  }

  Future<void> loadReminderById(String reminderId) {
    state = const AsyncLoading();
    return ReminderService().getReminder(reminderId).first.then((reminder) {
      state = AsyncData(reminder);
      return reminder;
    }).catchError((e, s) {
      state = AsyncError(e, stackTrace: s);
    });
  }

  void setDescription(String description) {
    state.whenData((reminder) {
      state = AsyncData(reminder.copyWith(description: description));
    });
  }

  void setDatetime(DateTime datetime) {
    state.whenData((reminder) {
      state = AsyncData(reminder.copyWith(datetime: datetime));
    });
  }

  Future<void> save() async {
    final reminder = state.value!;
    //CREATION
    if (reminder.id == '') {
      return ReminderService().createReminder(reminder);
      //EDITION
    } else {
      return ReminderService().updateReminder(reminder);
    }
  }

  Future<void> delete() async {
    final reminder = state.value!;
    return ReminderService().deleteReminder(reminder.id!);
  }
}
