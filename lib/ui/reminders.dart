import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remindersapp/services/reminder-service.dart';
import 'package:remindersapp/model/model.dart';
import 'package:remindersapp/shared/error.dart';
import 'package:remindersapp/shared/progress-indicator.dart';

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: FirestoreListView<Reminder>(
        query: FirestoreService().getReminders(),
        errorBuilder: (_, error, stackTrace) => ErrorScreen(error, stackTrace),
        loadingBuilder: (_) => const ProgressIndicatorScreen(),
        itemBuilder: (context, snapshot) {
          Reminder reminder = snapshot.data();

          return ListTile(
              title: Text(reminder.description),
              onTap: () =>
                  Navigator.of(context).pushNamed('/reminder', arguments: {
                    'id': reminder.id,
                  }));
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/reminder', arguments: {'id': ''});
        },
        label: const Text('New'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
