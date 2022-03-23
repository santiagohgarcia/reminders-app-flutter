import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:remindersapp/model/model.dart';
import 'package:remindersapp/services/auth-service.dart';
import 'package:rxdart/rxdart.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Reads all Reminders
  Stream<List<Reminder>> getReminders() {
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        return _db
            .collection('reminders')
            .where('user', isEqualTo: user.uid)
            .snapshots()
            .map((snapshot) => snapshot.docs)
            .map((docs) =>
                docs.map((doc) => Reminder.fromJson(doc.id, doc.data())))
            .map((docIterable) => docIterable.toList());
      } else {
        return Stream.fromIterable([]);
      }
    });
  }

  /// Reads a Reminder
  DocumentReference<Reminder> getReminder(String key) {
    return _db.collection('reminders').doc(key).withConverter<Reminder>(
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
