import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remindersapp/features/reminders/reminders_screen.controller.dart';
import 'package:remindersapp/features/_shared/error.dart';
import 'package:remindersapp/features/_shared/progress_indicator.dart';
import 'package:remindersapp/model/model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class RemindersCalendar extends ConsumerWidget {
  const RemindersCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reminders = ref.watch(remindersScreenStateNotifierProvider.select((state) => state.reminders ));
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
}
