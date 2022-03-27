import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remindersapp/controllers/reminder_controller.dart';
import 'package:remindersapp/routes.dart';
import 'package:remindersapp/services/reminder_service.dart';
import 'package:remindersapp/model/model.dart';
import 'package:remindersapp/shared/error.dart';
import 'package:remindersapp/shared/progress_indicator.dart';
import 'package:vrouter/vrouter.dart';
import '../../generated/l10n.dart';

class ReminderScreen extends ConsumerWidget {

  ReminderScreen(this.reminderId, {Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final String reminderId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reminder = ref.watch(reminderControllerProvider(reminderId == '<NEW>' ? null : reminderId));
    return reminder.when(
      data: (reminder) {
        return _scaffold(reminder);
      },
      error: (e, s) => ErrorScreen(e, s),
      loading: () => const ProgressIndicatorScreen(),
    );
  }

  /* 
   REMINDER SCAFFOLD
  */
  Scaffold _scaffold(Reminder reminder) {
    return Scaffold(
        appBar: AppBar(
          title: Text(reminder.description),
          actions: [
            reminder.id != ''
                ? IconButton(
                    onPressed: _deleteReminder,
                    icon: const Icon(FontAwesomeIcons.trashCan),
                  )
                : const SizedBox.shrink()
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: _form(reminder), //Reminder Form
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _saveReminder();
            }
          },
          label: Text(S.of(context).save),
          icon: const Icon(Icons.save),
        ));
  }

  /* 
  REMINDER FORM  
  */
  Form _form(Reminder reminder) {
    return Form(
      key: _formKey,
      child: Column(children: [
        //Description
        TextFormField(
            initialValue: reminder.description,
            decoration: InputDecoration(hintText: S.of(context).description),
            validator: (v) =>
                (v == null || v.isEmpty) ? S.of(context).mandatoryField : null,
            onChanged: (v) => setState(() => reminder.description = v)),
        //Date
        DateTimePicker(
            initialValue: reminder.datetime.toString(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            dateLabelText: S.of(context).date,
            validator: (v) =>
                (v == null || v.isEmpty) ? S.of(context).mandatoryField : null,
            onChanged: (v) =>
                setState(() => reminder.datetime = DateTime.parse(v)))
      ]),
    );
  }

  void _saveReminder() {


  }

  void _deleteReminder() {
    //DELETION
    ReminderService().deleteReminder(_reminder.id).then((value) {
      _showSnackBar(S.of(context).reminderDeleted);
      context.vRouter.to(RemindersRoute.path, isReplacement: true);
    });
  }

  void _showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 1),
    ));
  }
}
