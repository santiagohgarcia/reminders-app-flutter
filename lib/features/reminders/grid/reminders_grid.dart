import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remindersapp/features/_shared/lower_bar.dart';
import 'package:remindersapp/features/reminders/reminders_screen.controller.dart';
import 'package:remindersapp/features/_shared/error.dart';
import 'package:remindersapp/features/_shared/progress_indicator.dart';
import 'package:remindersapp/formatters.dart';
import 'package:remindersapp/model/model.dart';
import 'package:vrouter/vrouter.dart';

class RemindersGrid extends ConsumerWidget {
  const RemindersGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reminders = ref.watch(remindersScreenStateNotifierProvider
        .select((state) => state.reminders));

    return reminders.when(
        data: (reminders) => LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return GridView.count(
                crossAxisCount: constraints.maxWidth ~/ 250,
                childAspectRatio: 3 / 1,
                padding: const EdgeInsets.all(10),
                children: List.generate(
                  reminders.length,
                  (index) => _reminderCard(context, reminders[index]),
                ),
              );
            }),
        error: (e, s) => ErrorScreen(e, s),
        loading: () => const ProgressIndicatorScreen());
  }

  Card _reminderCard(BuildContext context, Reminder reminder) {
    return Card(
      child: ListTile(
        title: Text(reminder.description),
        subtitle: Text(dateFormatter.format(reminder.datetime)),
        onTap: () => context.vRouter.toNamed(
          'reminder',
          pathParameters: {'reminderId': reminder.id!},
        ),
      ),
    );
  }
}
