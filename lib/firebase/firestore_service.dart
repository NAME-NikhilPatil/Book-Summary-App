import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> getBookSummary(String documentId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _db.collection('Book_summaries').doc(documentId).get();

      if (snapshot.exists) {
        return snapshot.data();
      }
    } catch (e) {
      print('Error getting document: $e');
    }
    return null;
  }
}
