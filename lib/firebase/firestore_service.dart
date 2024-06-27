import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<String?> getBookDetail(String documentId) async {
    try {
      // Fetch the document by its ID from the 'Book_summaries' collection
      DocumentSnapshot snapshot = await _db.collection('Book_summaries').doc(documentId).get();

      // Check if the document exists and fetch the 'start with why' field
      if (snapshot.exists) {
        return snapshot.get('start with why') as String?;
      }
    } catch (e) {
      print('Error getting document: $e');
    }
    return null;
  }
}
