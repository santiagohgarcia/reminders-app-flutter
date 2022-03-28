// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Reminder _$ReminderFromJson(Map<String, dynamic> json) {
  return _Reminder.fromJson(json);
}

/// @nodoc
class _$ReminderTearOff {
  const _$ReminderTearOff();

  _Reminder call(
      {String? id,
      required String description,
      required DateTime datetime,
      required String user}) {
    return _Reminder(
      id: id,
      description: description,
      datetime: datetime,
      user: user,
    );
  }

  Reminder fromJson(Map<String, Object?> json) {
    return Reminder.fromJson(json);
  }
}

/// @nodoc
const $Reminder = _$ReminderTearOff();

/// @nodoc
mixin _$Reminder {
  String? get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get datetime => throw _privateConstructorUsedError;
  String get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReminderCopyWith<Reminder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderCopyWith<$Res> {
  factory $ReminderCopyWith(Reminder value, $Res Function(Reminder) then) =
      _$ReminderCopyWithImpl<$Res>;
  $Res call({String? id, String description, DateTime datetime, String user});
}

/// @nodoc
class _$ReminderCopyWithImpl<$Res> implements $ReminderCopyWith<$Res> {
  _$ReminderCopyWithImpl(this._value, this._then);

  final Reminder _value;
  // ignore: unused_field
  final $Res Function(Reminder) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? datetime = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: datetime == freezed
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ReminderCopyWith<$Res> implements $ReminderCopyWith<$Res> {
  factory _$ReminderCopyWith(_Reminder value, $Res Function(_Reminder) then) =
      __$ReminderCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String description, DateTime datetime, String user});
}

/// @nodoc
class __$ReminderCopyWithImpl<$Res> extends _$ReminderCopyWithImpl<$Res>
    implements _$ReminderCopyWith<$Res> {
  __$ReminderCopyWithImpl(_Reminder _value, $Res Function(_Reminder) _then)
      : super(_value, (v) => _then(v as _Reminder));

  @override
  _Reminder get _value => super._value as _Reminder;

  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? datetime = freezed,
    Object? user = freezed,
  }) {
    return _then(_Reminder(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: datetime == freezed
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Reminder extends _Reminder {
  const _$_Reminder(
      {this.id,
      required this.description,
      required this.datetime,
      required this.user})
      : super._();

  factory _$_Reminder.fromJson(Map<String, dynamic> json) =>
      _$$_ReminderFromJson(json);

  @override
  final String? id;
  @override
  final String description;
  @override
  final DateTime datetime;
  @override
  final String user;

  @override
  String toString() {
    return 'Reminder(id: $id, description: $description, datetime: $datetime, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Reminder &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.datetime, datetime) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(datetime),
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$ReminderCopyWith<_Reminder> get copyWith =>
      __$ReminderCopyWithImpl<_Reminder>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReminderToJson(this);
  }
}

abstract class _Reminder extends Reminder {
  const factory _Reminder(
      {String? id,
      required String description,
      required DateTime datetime,
      required String user}) = _$_Reminder;
  const _Reminder._() : super._();

  factory _Reminder.fromJson(Map<String, dynamic> json) = _$_Reminder.fromJson;

  @override
  String? get id;
  @override
  String get description;
  @override
  DateTime get datetime;
  @override
  String get user;
  @override
  @JsonKey(ignore: true)
  _$ReminderCopyWith<_Reminder> get copyWith =>
      throw _privateConstructorUsedError;
}
