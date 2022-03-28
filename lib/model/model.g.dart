// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Reminder _$$_ReminderFromJson(Map<String, dynamic> json) => _$_Reminder(
      id: json['id'] as String?,
      description: json['description'] as String,
      datetime: DateTime.parse(json['datetime'] as String),
      user: json['user'] as String,
    );

Map<String, dynamic> _$$_ReminderToJson(_$_Reminder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'datetime': instance.datetime.toIso8601String(),
      'user': instance.user,
    };
