import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:katasik_app/model/destination_model.dart';

import '../services/database.dart';

class DestinationViewModel extends GetxController {
  final List<DestinationModel> _destinations = [];
  final Rx<List<DestinationModel>> _foundDestinasi =
      Rx<List<DestinationModel>>([]);

  List<DestinationModel> get destinations => _destinations;
  Rx<List<DestinationModel>> get foundDestinasi => _foundDestinasi;

  _getDestinations() async {
    // _loading = true;
    List<QueryDocumentSnapshot> destinationsSnapshot =
        await Database().fetchDestinations();
    for (var destination in destinationsSnapshot) {
      destinations.add(
        DestinationModel.fromJson(
            destination.id, destination.data() as Map<String, dynamic>),
      );
    }
    // _loading = false;
    update();
  }

  void filterDestination(String nameDestination) {
    List<DestinationModel> results = [];
    if (nameDestination.isEmpty) {
      results = destinations;
    } else {
      results = destinations
          .where(
            (element) => element.name.toString().toLowerCase().contains(
                  nameDestination.toLowerCase(),
                ),
          )
          .toList();
    }
    foundDestinasi.value = results;
  }

  @override
  void onInit() {
    _getDestinations();
    foundDestinasi.value = destinations;
    super.onInit();
  }
}
