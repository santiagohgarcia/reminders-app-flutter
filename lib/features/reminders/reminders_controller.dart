import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remindersapp/model/model.dart';
import 'package:remindersapp/services/reminder_service.dart';

final remindersProvider = StreamProvider.autoDispose<List<Reminder>>(
    (ref) => ReminderService().getReminders());