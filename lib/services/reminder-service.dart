import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:remindersapp/model/model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Reads all Reminders
  Stream<List<Reminder>> getReminders() {
    return _db
        .collection('reminders')
        .snapshots()
        .map((snapshot) => snapshot.docs)
        .map((docs) => docs.map((doc) => Reminder.fromJson(doc.id, doc.data())))
        .map((docIterable) => docIterable.toList());
  }

  /// Reads a Reminder
  Stream<Reminder> getReminder(String key) {
    return _db
        .collection('reminders')
        .doc(key)
        .snapshots()
        .map((doc) => Reminder.fromJson(doc.id, doc.data()!));
  }

  /// Updates a Reminder
  Future<void> updateReminder(Reminder reminder) {
    return _db
        .collection('reminders')
        .doc(reminder.id)
        .set(reminder.toJson(), SetOptions(merge: true));
  }

  /// Creates a Reminder
  Future<DocumentReference<Map<String, dynamic>>> createReminder(
      Reminder reminder) {
    return _db.collection('reminders').add(reminder.toJson());
  }

  /// Creates a Reminder
  Future<void> deleteReminder(String id) {
    return _db.collection('reminders').doc(id).delete();
  }
}
