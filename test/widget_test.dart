// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:katasik_app/firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;

//   final CollectionReference _destionationRef =
//       FirebaseFirestore.instance.collection('destinations');

//   Future<List<QueryDocumentSnapshot>> _fetchDestinations() async {
//     try {
//       var categories = await _destionationRef.get();
//       return categories.docs;
//     } catch (e) {
//       // print(e);
//       rethrow;
//     }
//   }

//   var snapshot = await _fetchDestinations();

//   print(snapshot);
// }
