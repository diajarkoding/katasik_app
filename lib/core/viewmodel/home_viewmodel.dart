import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:katasik_app/model/destination_model.dart';

import '../services/database.dart';

class HomeViewModel extends GetxController {
  final List<DestinationModel> _destinations = [];

  List<DestinationModel> get destinations => _destinations;

  _getDestinations() async {
    // _loading = true;
    List<QueryDocumentSnapshot> destinationsSnapshot =
        await Database().getDestinations();
    for (var destination in destinationsSnapshot) {
      _destinations.add(
        DestinationModel.fromJson(
            destination.id, destination.data() as Map<String, dynamic>),
      );
    }
    // _loading = false;
    update();
  }

  @override
  void onInit() {
    _getDestinations();
    super.onInit();
  }
}
