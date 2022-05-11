import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final CollectionReference _destionationRef =
      FirebaseFirestore.instance.collection('destinations');

  CollectionReference get destionationRef => _destionationRef;

  Future<List<QueryDocumentSnapshot>> get fetchDestinations =>
      _fetchDestinations();

  Future<List<QueryDocumentSnapshot>> _fetchDestinations() async {
    try {
      var categories = await _destionationRef.get();
      return categories.docs;
    } catch (e) {
      // print(e);
      rethrow;
    }
  }
}
