import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remindersapp/features/reminder/reminder_controller.dart';
import 'package:remindersapp/features/_shared/error.dart';
import 'package:remindersapp/features/_shared/progress_indicator.dart';
import 'package:remindersapp/routes.dart';
import 'package:vrouter/vrouter.dart';
import '../../generated/l10n.dart';

class ReminderScreen extends ConsumerWidget {
  ReminderScreen(this._reminderId, {Key? key}) : super(key: key);

  get isCreation => _reminderId == null;
  get isUpdate => _reminderId != null;

  final String? _reminderId;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reminderProvider = reminderNotifierProvider(_reminderId);
    final _reminder = ref.watch(reminderProvider);
    return _reminder.when(
      data: (reminder) => Scaffold(
          appBar: AppBar(
            title: Text(reminder.description),
            actions: [
              isUpdate
                  ? IconButton(
                      onPressed: () async {
                        await ref.read(reminderProvider.notifier).delete();
                        context.vRouter.to(RemindersRoute.path);
                        _showSnackBar(context, S.of(context).reminderDeleted);
                      },
                      icon: const Icon(FontAwesomeIcons.trashCan),
                    )
                  : const SizedBox.shrink()
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(children: [
                //Description
                TextFormField(
                    initialValue: reminder.description,
                    decoration:
                        InputDecoration(hintText: S.of(context).description),
                    validator: (v) => (v == null || v.isEmpty)
                        ? S.of(context).mandatoryField
                        : null,
                    onChanged: (v) {
                      ref.read(reminderProvider.notifier).setDescription(v);
                    }),
                //Date
                DateTimePicker(
                    initialValue: reminder.datetime.toString(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    dateLabelText: S.of(context).date,
                    validator: (v) => (v == null || v.isEmpty)
                        ? S.of(context).mandatoryField
                        : null,
                    onChanged: (v) {
                      ref
                          .read(reminderProvider.notifier)
                          .setDatetime(DateTime.parse(v));
                    })
              ]),
            ), //Reminder Form
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                await ref.read(reminderProvider.notifier).save();
                context.vRouter.to(RemindersRoute.path);
                _showSnackBar(context, S.of(context).reminderUpdated);
              }
            },
            label: Text(S.of(context).save),
            icon: const Icon(Icons.save),
          )),
      error: (e, s) => ErrorScreen(e, s),
      loading: () => const ProgressIndicatorScreen(),
    );
  }

  void _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 1),
    ));
  }
}
