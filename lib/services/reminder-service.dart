import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:remindersapp/model/model.dart';
import 'package:remindersapp/services/auth-service.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Reads all Reminders
  Query<Reminder> getReminders() {
    return _db
        .collection('reminders')
        .withConverter<Reminder>(
          fromFirestore: (snapshot, _) =>
              Reminder.fromJson(snapshot.id, snapshot.data()!),
          toFirestore: (reminder, _) => reminder.toJson(),
        )
        .where('user', isEqualTo: AuthService().user!.uid);
  }

  /// Reads a Reminder
  DocumentReference<Reminder> getReminder(String key) {
    return _db
        .collection('reminders')
        .doc(key)
        .withConverter<Reminder>(
          fromFirestore: (snapshot, _) =>
              Reminder.fromJson(snapshot.id, snapshot.data()!),
          toFirestore: (reminder, _) => reminder.toJson(),
        );
  }

  /// Updates a Reminder
  Future<void> updateReminder(Reminder reminder) {
    var ref = _db.collection('reminders').doc(reminder.id);
    return ref.set(reminder.toJson(), SetOptions(merge: true));
  }

  /// Creates a Reminder
  Future<void> createReminder(Reminder reminder) {
    reminder.user = AuthService().user!.uid;
    return _db.collection('reminders').add(reminder.toJson());
  }

  /// Creates a Reminder
  Future<void> deleteReminder(String id) {
    return _db.collection('reminders').doc(id).delete();
  }
}
