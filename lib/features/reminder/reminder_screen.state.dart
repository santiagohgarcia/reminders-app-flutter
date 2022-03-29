import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:remindersapp/model/model.dart';

part 'reminder_screen.state.freezed.dart';

@freezed
class ReminderScreenState with _$ReminderScreenState {
  const factory ReminderScreenState({
    required AsyncValue<Reminder> reminder,
    required bool isCreation,
  }) = _ReminderScreenState;
}
