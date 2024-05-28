import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a new subject to the database
  Future<void> addSubject(String subject) async {
    try {
      await _firestore.collection("subjects").add({
        'subject': subject,
        'date_created': FieldValue.serverTimestamp(), // Use server timestamp
      });
    } catch (e) {
      print("Error adding subject: $e");
    }
  }

  // Get a stream of all subjects from the database
  Stream<QuerySnapshot> getSubjectStream() {
    return _firestore.collection("subjects")
                      .orderBy('date_created', descending: true)
                      .snapshots();
  }

  // Update a subject in the database
  Future<void> updateSubject(String docID, String newSubject) async {
    try {
      await _firestore.collection("subjects").doc(docID).update({
        'subject': newSubject,
        'date_updated': FieldValue.serverTimestamp(), // Update date_updated
      });
    } catch (e) {
      print("Error updating subject: $e");
    }
  }

  // Delete a subject from the database
  Future<void> deleteSubject(String docID) async {
    try {
      await _firestore.collection("subjects").doc(docID).delete();
    } catch (e) {
      print("Error deleting subject: $e");
    }
  }
}
