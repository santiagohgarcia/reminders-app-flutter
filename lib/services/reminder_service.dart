import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:remindersapp/model/model.dart';
import 'package:remindersapp/services/auth_service.dart';

class ReminderService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Reads all Reminders
  Stream<List<Reminder>> getReminders() {
    final user = AuthService().user!;
    return _db
        .collection('reminders')
        .where('user', isEqualTo: user.uid)
        .snapshots()
        .map((snapshot) => snapshot.docs)
        .map((docs) => docs.map(Reminder.fromDocument))
        .map((reminders) => reminders.toList());
  }

  /// Reads a Reminder
  Stream<Reminder> getReminder(String id) {
    return _db
        .collection('reminders')
        .doc(id)
        .snapshots()
        .map(Reminder.fromDocument);
  }

  /// Updates a Reminder
  Future<void> updateReminder(Reminder reminder) {
    var ref = _db.collection('reminders').doc(reminder.id);
    return ref.set(reminder.toDocument(), SetOptions(merge: true));
  }

  /// Creates a Reminder
  Future<void> createReminder(Reminder reminder) {
    final user = AuthService().user!;
    reminder = reminder.copyWith(user: user.uid);
    return _db.collection('reminders').add(reminder.toDocument());
  }

  /// Creates a Reminder
  Future<void> deleteReminder(String id) {
    return _db.collection('reminders').doc(id).delete();
  }
}
