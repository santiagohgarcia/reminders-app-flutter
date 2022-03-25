import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remindersapp/services/reminder-service.dart';
import 'package:remindersapp/model/model.dart';
import 'package:remindersapp/shared/error.dart';
import 'package:remindersapp/shared/progress-indicator.dart';

final reminderProvider = FutureProvider.autoDispose.family<Reminder, String>(
    (ref, reminderId) => FirestoreService().getReminder(reminderId).first);

class ReminderScreen extends ConsumerStatefulWidget {
  const ReminderScreen({Key? key}) : super(key: key);

  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends ConsumerState<ReminderScreen> {
  Reminder _reminder = Reminder('', '', DateTime.now(), '');

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext contex) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    final _reminderId = args['id'];

    //CREATION FLOW
    if (_reminderId == '') {
      return _scaffold;
    }

    //EDITION FLOW
    final reminder = ref.watch(reminderProvider(_reminderId));

    return reminder.when(
        data: (reminder) {
          _reminder = reminder;
          return _scaffold;
        },
        error: (e, s) => ErrorScreen(e, s),
        loading: () => const ProgressIndicatorScreen());
  }

  Scaffold get _scaffold {
    return Scaffold(
        appBar: AppBar(
          title: Text(_reminder.description),
          actions: [
            _reminder.id != ''
                ? IconButton(
                    onPressed: _deleteReminder,
                    icon: const Icon(FontAwesomeIcons.trashCan),
                  )
                : const SizedBox.shrink()
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: _form, //Reminder Form
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _saveReminder();
            }
          },
          label: const Text('Save'),
          icon: const Icon(Icons.save),
        ));
  }

  Form get _form {
    return Form(
      key: _formKey,
      child: Column(children: [
        //Description
        TextFormField(
            initialValue: _reminder.description,
            decoration: const InputDecoration(hintText: 'Description'),
            validator: (v) =>
                (v == null || v.isEmpty) ? 'Mandatory field' : null,
            onChanged: (v) => setState(() => _reminder.description = v)),
        //Date
        DateTimePicker(
            initialValue: _reminder.datetime.toString(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            dateLabelText: 'Date',
            validator: (v) =>
                (v == null || v.isEmpty) ? 'Mandatory field' : null,
            onChanged: (v) =>
                setState(() => _reminder.datetime = DateTime.parse(v)))
      ]),
    );
  }

  void _saveReminder() {
    //CREATION
    if (_reminder.id == '') {
      FirestoreService().createReminder(_reminder).then((response) {
        _showSnackBar('Reminder Created!');
        Navigator.pushReplacementNamed(context, '/reminders');
      });
      //EDITION
    } else {
      FirestoreService().updateReminder(_reminder).then((_) {
        _showSnackBar('Reminder Updated!');
        Navigator.pushReplacementNamed(context, '/reminders');
      });
    }
  }

  void _showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 1),
    ));
  }

  void _deleteReminder() {
    //DELETION
    FirestoreService().deleteReminder(_reminder.id).then((value) {
      _showSnackBar('Reminder Deleted!');
      Navigator.pushReplacementNamed(context, '/reminders');
    });
  }
}
