import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remindersapp/ui/reminders/reminders-calendar.dart';
import 'package:remindersapp/ui/reminders/reminders-list.dart';

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reminders App'),
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(FontAwesomeIcons.list)),
              Tab(icon: Icon(FontAwesomeIcons.calendar)),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.user),
              tooltip: 'Profile',
              onPressed: () => Navigator.of(context).pushNamed('/profile'),
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            RemindersList(),
            RemindersCalendar(),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, '/reminder', arguments: {'id': ''});
          },
          label: const Text('New'),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
