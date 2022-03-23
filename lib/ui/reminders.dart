import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remindersapp/services/reminder-service.dart';
import 'package:remindersapp/model/model.dart';
import 'package:remindersapp/shared/error.dart';
import 'package:remindersapp/shared/progress-indicator.dart';

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Reminder>>(
      stream: FirestoreService().getReminders(),
      builder: (_, remindersSnapshot) {
        //SUCCESS
        if (remindersSnapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Reminders App'),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  icon: const Icon(FontAwesomeIcons.user),
                  tooltip: 'Profile',
                  onPressed: () => Navigator.of(context).pushNamed('/profile'),
                ),
              ],
            ),
            body: ListView(
              children: remindersSnapshot.data! //reminders list
                  .map((r) => ListTile(
                        title: Text(r.description),
                        onTap: () => {
                          Navigator.pushNamed(context, '/reminder',
                              arguments: {'key': r.id})
                        },
                      ))
                  .toList(),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.pushNamed(context, '/reminder',
                    arguments: {'key': ''});
              },
              label: const Text('New'),
              icon: const Icon(Icons.add),
            ),
          );
          //ERROR
        } else if (remindersSnapshot.hasError) {
          return const ErrorScreen();
          //WAITING
        } else {
          return const ProgressIndicatorScreen();
        }
      },
    );
  }
}
