// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reminder_screen.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ReminderScreenStateTearOff {
  const _$ReminderScreenStateTearOff();

  _ReminderScreenState call(
      {required AsyncValue<Reminder> reminder, required bool isCreation}) {
    return _ReminderScreenState(
      reminder: reminder,
      isCreation: isCreation,
    );
  }
}

/// @nodoc
const $ReminderScreenState = _$ReminderScreenStateTearOff();

/// @nodoc
mixin _$ReminderScreenState {
  AsyncValue<Reminder> get reminder => throw _privateConstructorUsedError;
  bool get isCreation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReminderScreenStateCopyWith<ReminderScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderScreenStateCopyWith<$Res> {
  factory $ReminderScreenStateCopyWith(
          ReminderScreenState value, $Res Function(ReminderScreenState) then) =
      _$ReminderScreenStateCopyWithImpl<$Res>;
  $Res call({AsyncValue<Reminder> reminder, bool isCreation});
}

/// @nodoc
class _$ReminderScreenStateCopyWithImpl<$Res>
    implements $ReminderScreenStateCopyWith<$Res> {
  _$ReminderScreenStateCopyWithImpl(this._value, this._then);

  final ReminderScreenState _value;
  // ignore: unused_field
  final $Res Function(ReminderScreenState) _then;

  @override
  $Res call({
    Object? reminder = freezed,
    Object? isCreation = freezed,
  }) {
    return _then(_value.copyWith(
      reminder: reminder == freezed
          ? _value.reminder
          : reminder // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Reminder>,
      isCreation: isCreation == freezed
          ? _value.isCreation
          : isCreation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ReminderScreenStateCopyWith<$Res>
    implements $ReminderScreenStateCopyWith<$Res> {
  factory _$ReminderScreenStateCopyWith(_ReminderScreenState value,
          $Res Function(_ReminderScreenState) then) =
      __$ReminderScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({AsyncValue<Reminder> reminder, bool isCreation});
}

/// @nodoc
class __$ReminderScreenStateCopyWithImpl<$Res>
    extends _$ReminderScreenStateCopyWithImpl<$Res>
    implements _$ReminderScreenStateCopyWith<$Res> {
  __$ReminderScreenStateCopyWithImpl(
      _ReminderScreenState _value, $Res Function(_ReminderScreenState) _then)
      : super(_value, (v) => _then(v as _ReminderScreenState));

  @override
  _ReminderScreenState get _value => super._value as _ReminderScreenState;

  @override
  $Res call({
    Object? reminder = freezed,
    Object? isCreation = freezed,
  }) {
    return _then(_ReminderScreenState(
      reminder: reminder == freezed
          ? _value.reminder
          : reminder // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Reminder>,
      isCreation: isCreation == freezed
          ? _value.isCreation
          : isCreation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ReminderScreenState implements _ReminderScreenState {
  const _$_ReminderScreenState(
      {required this.reminder, required this.isCreation});

  @override
  final AsyncValue<Reminder> reminder;
  @override
  final bool isCreation;

  @override
  String toString() {
    return 'ReminderScreenState(reminder: $reminder, isCreation: $isCreation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReminderScreenState &&
            const DeepCollectionEquality().equals(other.reminder, reminder) &&
            const DeepCollectionEquality()
                .equals(other.isCreation, isCreation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(reminder),
      const DeepCollectionEquality().hash(isCreation));

  @JsonKey(ignore: true)
  @override
  _$ReminderScreenStateCopyWith<_ReminderScreenState> get copyWith =>
      __$ReminderScreenStateCopyWithImpl<_ReminderScreenState>(
          this, _$identity);
}

abstract class _ReminderScreenState implements ReminderScreenState {
  const factory _ReminderScreenState(
      {required AsyncValue<Reminder> reminder,
      required bool isCreation}) = _$_ReminderScreenState;

  @override
  AsyncValue<Reminder> get reminder;
  @override
  bool get isCreation;
  @override
  @JsonKey(ignore: true)
  _$ReminderScreenStateCopyWith<_ReminderScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
