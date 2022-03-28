// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reminders_screen.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RemindersScreenStateTearOff {
  const _$RemindersScreenStateTearOff();

  _RemindersScreenState call(
      {required AsyncValue<List<Reminder>> reminders,
      required int selectedTabIndex}) {
    return _RemindersScreenState(
      reminders: reminders,
      selectedTabIndex: selectedTabIndex,
    );
  }
}

/// @nodoc
const $RemindersScreenState = _$RemindersScreenStateTearOff();

/// @nodoc
mixin _$RemindersScreenState {
  AsyncValue<List<Reminder>> get reminders =>
      throw _privateConstructorUsedError;
  int get selectedTabIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RemindersScreenStateCopyWith<RemindersScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemindersScreenStateCopyWith<$Res> {
  factory $RemindersScreenStateCopyWith(RemindersScreenState value,
          $Res Function(RemindersScreenState) then) =
      _$RemindersScreenStateCopyWithImpl<$Res>;
  $Res call({AsyncValue<List<Reminder>> reminders, int selectedTabIndex});
}

/// @nodoc
class _$RemindersScreenStateCopyWithImpl<$Res>
    implements $RemindersScreenStateCopyWith<$Res> {
  _$RemindersScreenStateCopyWithImpl(this._value, this._then);

  final RemindersScreenState _value;
  // ignore: unused_field
  final $Res Function(RemindersScreenState) _then;

  @override
  $Res call({
    Object? reminders = freezed,
    Object? selectedTabIndex = freezed,
  }) {
    return _then(_value.copyWith(
      reminders: reminders == freezed
          ? _value.reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Reminder>>,
      selectedTabIndex: selectedTabIndex == freezed
          ? _value.selectedTabIndex
          : selectedTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$RemindersScreenStateCopyWith<$Res>
    implements $RemindersScreenStateCopyWith<$Res> {
  factory _$RemindersScreenStateCopyWith(_RemindersScreenState value,
          $Res Function(_RemindersScreenState) then) =
      __$RemindersScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({AsyncValue<List<Reminder>> reminders, int selectedTabIndex});
}

/// @nodoc
class __$RemindersScreenStateCopyWithImpl<$Res>
    extends _$RemindersScreenStateCopyWithImpl<$Res>
    implements _$RemindersScreenStateCopyWith<$Res> {
  __$RemindersScreenStateCopyWithImpl(
      _RemindersScreenState _value, $Res Function(_RemindersScreenState) _then)
      : super(_value, (v) => _then(v as _RemindersScreenState));

  @override
  _RemindersScreenState get _value => super._value as _RemindersScreenState;

  @override
  $Res call({
    Object? reminders = freezed,
    Object? selectedTabIndex = freezed,
  }) {
    return _then(_RemindersScreenState(
      reminders: reminders == freezed
          ? _value.reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Reminder>>,
      selectedTabIndex: selectedTabIndex == freezed
          ? _value.selectedTabIndex
          : selectedTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_RemindersScreenState implements _RemindersScreenState {
  const _$_RemindersScreenState(
      {required this.reminders, required this.selectedTabIndex});

  @override
  final AsyncValue<List<Reminder>> reminders;
  @override
  final int selectedTabIndex;

  @override
  String toString() {
    return 'RemindersScreenState(reminders: $reminders, selectedTabIndex: $selectedTabIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RemindersScreenState &&
            const DeepCollectionEquality().equals(other.reminders, reminders) &&
            const DeepCollectionEquality()
                .equals(other.selectedTabIndex, selectedTabIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(reminders),
      const DeepCollectionEquality().hash(selectedTabIndex));

  @JsonKey(ignore: true)
  @override
  _$RemindersScreenStateCopyWith<_RemindersScreenState> get copyWith =>
      __$RemindersScreenStateCopyWithImpl<_RemindersScreenState>(
          this, _$identity);
}

abstract class _RemindersScreenState implements RemindersScreenState {
  const factory _RemindersScreenState(
      {required AsyncValue<List<Reminder>> reminders,
      required int selectedTabIndex}) = _$_RemindersScreenState;

  @override
  AsyncValue<List<Reminder>> get reminders;
  @override
  int get selectedTabIndex;
  @override
  @JsonKey(ignore: true)
  _$RemindersScreenStateCopyWith<_RemindersScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
