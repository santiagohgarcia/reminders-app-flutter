import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remindersapp/features/reminders/reminders_screen.state.dart';
import 'package:remindersapp/model/model.dart';
import 'package:remindersapp/services/reminder_service.dart';

/*
  DATA PROVIDERS
*/
final remindersDataProvider = StreamProvider.autoDispose<List<Reminder>>(
    (ref) => ReminderService().getReminders());

/*
  STATE NOTIFIER PROVIDER
*/
final remindersScreenStateNotifierProvider = StateNotifierProvider.autoDispose<
    RemindersStateNotifier, RemindersScreenState>((ref) {
  final reminders = ref.watch(remindersDataProvider);
  return RemindersStateNotifier(
      RemindersScreenState(reminders: reminders, selectedTabIndex: 0));
});

/*
  STATE NOTIFIER (CONTROLLER)
*/
class RemindersStateNotifier extends StateNotifier<RemindersScreenState> {
  RemindersStateNotifier(RemindersScreenState state) : super(state);

  void setSelectedTabIndex(int selectedTabIndex) {
    state = state.copyWith(selectedTabIndex: selectedTabIndex);
  }
}
