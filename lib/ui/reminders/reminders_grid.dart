import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrouter/vrouter.dart';
import '../../formatters.dart';
import '../../model/model.dart';
import '../../services/reminder_service.dart';
import '../../shared/error.dart';
import '../../shared/progress_indicator.dart';

final remindersProvider = StreamProvider.autoDispose<List<Reminder>>(
    (ref) => ReminderService().getReminders());

class RemindersGrid extends ConsumerWidget {
  const RemindersGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reminders = ref.watch(remindersProvider);

    return reminders.when(
        data: (reminders) => LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) =>
                  GridView.count(
                crossAxisCount: constraints.maxWidth ~/ 250,
                childAspectRatio: 3 / 1,
                padding: const EdgeInsets.all(10),
                children: List.generate(
                  reminders.length,
                  (index) => _reminderCard(context, reminders[index]),
                ),
              ),
            ),
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
          pathParameters: {'reminderId': reminder.id},
        ),
      ),
    );
  }
}
