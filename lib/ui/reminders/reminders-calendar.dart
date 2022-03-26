import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remindersapp/theme.dart';
import '../../model/model.dart';
import '../../services/reminder-service.dart';
import '../../shared/error.dart';
import '../../shared/progress-indicator.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

final remindersProvider = StreamProvider.autoDispose<List<Reminder>>(
    (ref) => FirestoreService().getReminders());

class RemindersCalendar extends ConsumerWidget {
  const RemindersCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reminders = ref.watch(remindersProvider);

      return reminders.when(
          data: (reminders) {
            return SfCalendar(
              view: CalendarView.month,
              dataSource: RemindersDataSource(reminders),
              allowedViews: const [
                CalendarView.day,
                CalendarView.week,
                CalendarView.workWeek,
                CalendarView.month,
                CalendarView.schedule
              ],
              showNavigationArrow: true,
              monthViewSettings: const MonthViewSettings(
                  appointmentDisplayMode:
                      MonthAppointmentDisplayMode.appointment),
            );
          },
          error: (e, s) => ErrorScreen(e, s),
          loading: () => const ProgressIndicatorScreen());
  }
}

class RemindersDataSource extends CalendarDataSource<List<Reminder>> {
  RemindersDataSource(List<Reminder> reminders) {
    appointments = reminders;
  }

  @override
  DateTime getStartTime(int index) {
    final DateTime dateTime = appointments![index].datetime;
    return DateTime(dateTime.year, dateTime.month, dateTime.day, 9, 0, 0);
  }

  @override
  DateTime getEndTime(int index) {
    final DateTime dateTime = appointments![index].datetime;
    return DateTime(dateTime.year, dateTime.month, dateTime.day, 11, 0, 0);
  }

  @override
  String getSubject(int index) {
    return appointments![index].description;
  }

  @override
  Color getColor(int index) {
    return appTheme.secondaryHeaderColor;
  }
}
