
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:remindersapp/model/model.dart';

part 'reminders_screen.state.freezed.dart';

@freezed
class RemindersScreenState with _$RemindersScreenState {
  const factory RemindersScreenState(
      {required AsyncValue<List<Reminder>> reminders,
      required int selectedTabIndex}) = _RemindersScreenState;
}
