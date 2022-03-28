import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remindersapp/features/reminders/calendar/reminders_calendar.dart';
import 'package:remindersapp/features/reminders/grid/reminders_grid.dart';
import 'package:remindersapp/features/reminders/reminders_screen.controller.dart';
import 'package:remindersapp/routes.dart';
import 'package:remindersapp/theme.dart';
import 'package:vrouter/vrouter.dart';
import '../../generated/l10n.dart';

class RemindersScreen extends ConsumerWidget {
  const RemindersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remindersState = ref.watch(remindersScreenStateNotifierProvider);

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).remindersApp),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.user),
              tooltip: S.of(context).profile,
              onPressed: () => context.vRouter.to('/profile'),
            ),
          ],
        ),
        body: [
          const RemindersGrid(),
          const RemindersCalendar()
        ][remindersState.selectedTabIndex],
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: appTheme.primaryColor,
            currentIndex: remindersState.selectedTabIndex,
            onTap: (index) {
              ref
                  .watch(remindersScreenStateNotifierProvider.notifier)
                  .setSelectedTabIndex(index);
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.list), label: 'List'),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.calendar), label: 'Calendar'),
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
