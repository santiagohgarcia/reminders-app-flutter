import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remindersapp/features/reminders/lower_bar.dart';
import 'package:remindersapp/features/reminders/reminders_calendar.dart';
import 'package:remindersapp/features/reminders/reminders_grid.dart';
import 'package:remindersapp/routes.dart';
import 'package:vrouter/vrouter.dart';
import '../../generated/l10n.dart';

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).remindersApp),
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(FontAwesomeIcons.list)),
              Tab(icon: Icon(FontAwesomeIcons.calendar))
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.user),
              tooltip: S.of(context).profile,
              onPressed: () => context.vRouter.to('/profile'),
            ),
          ],
        ),
        body: Stack(children: [
          lowerBar,
          TabBarView(
            children: [
              RemindersGrid(),
              RemindersCalendar(),
            ],
          )
        ]),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => context.vRouter.to(NewReminderRoute.path),
          label: Text(S.of(context).newItem),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
