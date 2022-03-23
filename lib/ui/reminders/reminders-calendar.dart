import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:remindersapp/theme.dart';
import '../../model/model.dart';
import '../../services/reminder-service.dart';
import '../../shared/error.dart';
import '../../shared/progress-indicator.dart';
import 'package:calendar_view/calendar_view.dart';

class RemindersCalendar extends StatelessWidget {
  const RemindersCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        return StreamBuilder<List<Reminder>>(
          stream: FirestoreService().getReminders(),
          builder: (context, snapshot) {
            //SUCCESS
            if (snapshot.hasData) {
              final reminders = snapshot.data;

              final remindersEvents = reminders?.map((reminder) {
                return CalendarEventData(
                  date: reminder.datetime,
                  event: reminder,
                  color: appTheme.colorScheme.secondary,
                  title: reminder.description,
                  startTime: DateTime(reminder.datetime.year,
                      reminder.datetime.month, reminder.datetime.day, 0, 0),
                  endTime: DateTime(reminder.datetime.year,
                      reminder.datetime.month, reminder.datetime.day, 23, 59),
                );
              }).toList();

              final eventController = EventController<Reminder>()
                ..addAll(remindersEvents!);

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
                    Navigator.of(context)
                        .pushNamed('/reminder', arguments: {'id': reminder.id});
                  });
              //ERROR
            } else if (snapshot.hasError) {
              return ErrorScreen(snapshot.error, snapshot.stackTrace);
              //WAITING
            } else {
              return const ProgressIndicatorScreen();
            }
          },
        );
      },
    );
  }
}
