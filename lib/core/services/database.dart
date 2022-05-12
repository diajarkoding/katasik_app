import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static final CollectionReference _destionationRef =
      FirebaseFirestore.instance.collection('destinations');

  static CollectionReference get destionationRef => _destionationRef;

  static Future<List<QueryDocumentSnapshot>> get fetchDestinations =>
      _fetchDestinations();

  static Future<List<QueryDocumentSnapshot>> _fetchDestinations() async {
    try {
      var categories = await _destionationRef.get();
      return categories.docs;
    } catch (e) {
      // print(e);
      rethrow;
    }
  }
}
