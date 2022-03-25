import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class Reminder {
  String id;
  String description;
  DateTime datetime;
  String user;
  
  Reminder(
    this.id,
    this.description,
    this.datetime,
    this.user
  );

  factory Reminder.fromJson(String id, Map<String, dynamic> json) {
    json["id"] = id; //id property is not stored in the body of the entity
    json["datetime"] = ((json["datetime"] as Timestamp).toDate().toString()); //special conversion to support datetime
    return _$ReminderFromJson(json);
  }

  Map<String, dynamic> toJson() {
    var json = _$ReminderToJson(this);
    json['datetime'] = Timestamp.fromDate(DateTime.parse(json['datetime']));
    json.remove('id'); //id property is not stored in the body of the entity
    return json;
  }
  
}
