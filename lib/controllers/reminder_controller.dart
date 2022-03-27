import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remindersapp/model/model.dart';
import 'package:remindersapp/services/reminder_service.dart';

final reminderControllerProvider = StateNotifierProvider.autoDispose
    .family<ReminderController, AsyncValue<Reminder>, String?>(
        (ref, reminderId) {
  if (reminderId == null) {
    return ReminderController.fromNewReminder();
  } else {
    return ReminderController.fromReminderid(reminderId);
  }
});

class ReminderController extends StateNotifier<AsyncValue<Reminder>> {
  ReminderController(AsyncValue<Reminder> reminder) : super(reminder);

  static ReminderController fromNewReminder() {
    final newReminder = AsyncValue.data(Reminder('', '', DateTime.now(), ''));
    return ReminderController(newReminder);
  }

  static ReminderController fromReminderid(String reminderId) {
    final reminderController = ReminderController(const AsyncValue.loading());
    //Load reminder by ID
    ReminderService()
        .getReminder(reminderId)
        .first
        .then(
            (reminder) => reminderController.state = AsyncValue.data(reminder))
        .catchError((e, s) =>
            reminderController.state = AsyncValue.error(e, stackTrace: s));
    return reminderController;
  }

  void persisteState() async {
    state = const AsyncValue.loading();
    state.whenData((reminder) {
      if (reminder.id == '') {
        return ReminderService().createReminder(reminder);
        //EDITION
      } else {
        return ReminderService().updateReminder(reminder);
      }
    });
  }

  void deleteState() async {
    ReminderService().deleteReminder(reminder.id);
  }
}
