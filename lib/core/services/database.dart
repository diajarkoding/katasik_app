import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final CollectionReference _destionationRef =
      FirebaseFirestore.instance.collection('destinations');

  Future<List<QueryDocumentSnapshot>> fetchDestinations() async {
    try {
      var categories = await _destionationRef.get();
      return categories.docs;
    } catch (e) {
      // print(e);
      rethrow;
    }
  }
}
