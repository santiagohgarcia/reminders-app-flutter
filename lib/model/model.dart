import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'model.freezed.dart';
part 'model.g.dart';

@freezed
abstract class Reminder with _$Reminder {
  const Reminder._();

  const factory Reminder(
      {String? id,
      required String description,
      required DateTime datetime,
      required String user}) = _Reminder;

  factory Reminder.empty(String user) =>
      Reminder(description: '', datetime: DateTime.now(), user: user);

  factory Reminder.fromJson(json) {
    json["datetime"] = ((json["datetime"] as Timestamp).toDate().toString());
    return _$ReminderFromJson(json);
  }

  factory Reminder.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()!;
    return Reminder.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() {
    var json = toJson();
    json['datetime'] = Timestamp.fromDate(DateTime.parse(json['datetime']));
    json.remove('id'); //id property is not stored in the body of the entity
    return json;
  }
}
