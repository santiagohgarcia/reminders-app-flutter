import 'package:flutter/material.dart';

import '../../formatters.dart';
import '../../model/model.dart';
import '../../services/reminder-service.dart';
import '../../shared/error.dart';
import '../../shared/progress-indicator.dart';

class RemindersList extends StatelessWidget {
  const RemindersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Reminder>>(
      stream: FirestoreService().getReminders(),
      builder: (context, snapshot) {
        //SUCCESS
        if (snapshot.hasData) {
          List<Reminder> reminders = snapshot.data!;
          return ListView.builder(
            itemCount: reminders.length,
            itemBuilder: (context, index) {
              final reminder = reminders[index];
              return ListTile(
                title: Text(reminder.description),
                subtitle: Text(dateFormatter.format(reminder.datetime)),
                onTap: () => {
                  Navigator.of(context).pushNamed('/reminder', arguments: {'id': reminder.id})
                },
              );
            },
          );
          //ERROR
        } else if (snapshot.hasError) {
          return ErrorScreen(snapshot.error, snapshot.stackTrace);
          //WAITING
        } else {
          return const ProgressIndicatorScreen();
        }
      },
    );
  }
}
