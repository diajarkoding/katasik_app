import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final CollectionReference _destionationRef =
      FirebaseFirestore.instance.collection('destinations');

  Future<List<QueryDocumentSnapshot>> getDestinations() async {
    var categories = await _destionationRef.get();
    return categories.docs;
  }
  // final CollectionReference testRef =
  //     FirebaseFirestore.instance.collection('test');

  // Future<List<DestinationModel>> fetchDestinations() async {
  //   try {
  //     QuerySnapshot result = await _destionationRef.get();
  //     List<DestinationModel> destinations = result.docs.map((e) {
  //       return DestinationModel.fromJson(
  //         e.id,
  //         e.data() as Map<String, dynamic>,
  //       );
  //     }).toList();
  //     return destinations;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<QuerySnapshot<Object?>> fetchTest() async {
  //   QuerySnapshot result = await testRef.get();
  //   return result;
  // }

  // Future<DestinationModel> fetchDestination() async {
  //   try {
  //     DocumentSnapshot snapshot =
  //         await firestore.collection('destinaions').doc().get();

  //     return DestinationModel.fromJson(snapshot.data() as Map<String, dynamic>);
  //   } catch (e) {
  //     print(e);
  //     rethrow;
  //   }
  // }

  // Stream<List<DestinationModel>> streamDestination() async* {
  //   try {
  //     firestore
  //         .collection('destinaions')
  //         .doc()
  //         .snapshots()
  //         .map(
  //           (snapshot) => DestinationModel.fromJson(
  //             e.id,  snapshot.data() as Map<String, dynamic>),
  //         )
  //         .toList();
  //   } catch (e) {
  //     print(e);
  //     rethrow;
  //   }
  // }
}
