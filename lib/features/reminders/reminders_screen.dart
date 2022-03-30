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
    final selectedTabIndex = ref.watch(remindersScreenStateNotifierProvider
        .select((state) => state.selectedTabIndex));

    return Scaffold(
      /*APP BAR */
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
      backgroundColor: Theme.of(context).colorScheme.background,
      /* BODY */
      body: [
        const RemindersGrid(),
        const RemindersCalendar()
      ][selectedTabIndex],
      /* BOTTOM NAVIGATION BAR */
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedTabIndex,
        onDestinationSelected: (index) => ref
            .watch(remindersScreenStateNotifierProvider.notifier)
            .setSelectedTabIndex(index),
        destinations: const [
          NavigationDestination(
              icon: Icon(FontAwesomeIcons.list), label: 'List'),
          NavigationDestination(
              icon: Icon(FontAwesomeIcons.calendar), label: 'Calendar'),
        ],
      ),
      /*FLOATING ACTION BUTTON */
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.vRouter.to(NewReminderRoute.path),
        label: Text(S.of(context).newItem),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
