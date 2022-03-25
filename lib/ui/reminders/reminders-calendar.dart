import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remindersapp/formatters.dart';
import 'package:remindersapp/theme.dart';
import '../../model/model.dart';
import '../../services/reminder-service.dart';
import '../../shared/error.dart';
import '../../shared/progress-indicator.dart';
import 'package:calendar_view/calendar_view.dart';

final remindersProvider =
    StreamProvider<List<Reminder>>((ref) => FirestoreService().getReminders());

class RemindersCalendar extends ConsumerWidget {
  const RemindersCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(builder: (_, BoxConstraints constraints) {
      final reminders = ref.watch(remindersProvider);

      return reminders.when(
          data: (reminders) {
            final calendarEvents = _mapRemindersToCalendarEvents(reminders);

            final eventController = EventController<Reminder>()
              ..addAll(calendarEvents);

            return MonthView(
                controller: eventController,
                // headerBuilder: (datetime) => MonthPageHeader(
                //       date: datetime,
                //       backgroundColor: appTheme.bottomAppBarColor
                //     ),
                minMonth: DateTime(1990),
                maxMonth: DateTime(2050),
                initialMonth: DateTime.now(),
                cellAspectRatio: constraints.maxWidth / constraints.maxHeight,
                onEventTap: (event, date) {
                  final reminder = event.event as Reminder;
                  Navigator.of(context).pushNamed('/reminder/' + reminder.id);
                });
          },
          error: (e, s) => ErrorScreen(e, s),
          loading: () => const ProgressIndicatorScreen());
    });
  }

  List<CalendarEventData<Reminder>> _mapRemindersToCalendarEvents(
      List<Reminder> reminders) {
    return reminders
        .map((reminder) => CalendarEventData<Reminder>(
              date: reminder.datetime,
              event: reminder,
              color: appTheme.colorScheme.secondary,
              title: timeFormatter.format(reminder.datetime) +
                  " " +
                  reminder.description,
              startTime: DateTime(reminder.datetime.year,
                  reminder.datetime.month, reminder.datetime.day, 0, 0),
              endTime: DateTime(reminder.datetime.year, reminder.datetime.month,
                  reminder.datetime.day, 23, 59),
            ))
        .toList();
  }
}
