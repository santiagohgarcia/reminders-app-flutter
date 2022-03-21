// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reminder _$ReminderFromJson(Map<String, dynamic> json) => Reminder(
      json['id'] as String,
      json['description'] as String,
      DateTime.parse(json['datetime'] as String),
      json['user'] as String,
    );

Map<String, dynamic> _$ReminderToJson(Reminder instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'datetime': instance.datetime.toIso8601String(),
      'user': instance.user,
    };
