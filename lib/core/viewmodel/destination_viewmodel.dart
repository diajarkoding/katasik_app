import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:katasik_app/model/destination_model.dart';

import '../services/database.dart';

class DestinationViewModel extends GetxController {
  final List<DestinationModel> _destinations = [];
  List<DestinationModel> _foundDestination = [];

  List<DestinationModel> get destinations => _destinations;
  List<DestinationModel> get foundDestination => _foundDestination;

  set setFoundDestination(List<DestinationModel> value) {
    _foundDestination = value;
  }

  Future<void> _getDestinations() async {
    List<QueryDocumentSnapshot> destinationsSnapshot =
        await Database().fetchDestinations();
    for (var destination in destinationsSnapshot) {
      destinations.add(
        DestinationModel.fromJson(
            destination.id, destination.data() as Map<String, dynamic>),
      );
    }
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

    setFoundDestination = results;
    update();
  }

  @override
  void onInit() {
    _getDestinations();
    setFoundDestination = destinations;
    super.onInit();
  }
}
