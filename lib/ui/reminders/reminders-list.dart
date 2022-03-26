import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrouter/vrouter.dart';

import '../../formatters.dart';
import '../../model/model.dart';
import '../../services/reminder-service.dart';
import '../../shared/error.dart';
import '../../shared/progress-indicator.dart';

final remindersProvider = StreamProvider.autoDispose<List<Reminder>>(
    (ref) => FirestoreService().getReminders());

class RemindersList extends ConsumerWidget {
  const RemindersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reminders = ref.watch(remindersProvider);

    return reminders.when(
        data: (reminders) {
          return ListView.builder(
            itemCount: reminders.length,
            itemBuilder: (context, index) {
              final reminder = reminders[index];
              return ListTile(
                title: Text(reminder.description),
                subtitle: Text(dateFormatter.format(reminder.datetime)),
                onTap: () =>
                    context.vRouter.toNamed('reminder', pathParameters: {
                  'reminderId': reminder.id,
                }),
              );
            },
          );
        },
        error: (e, s) => ErrorScreen(e, s),
        loading: () => const ProgressIndicatorScreen());
  }
}
