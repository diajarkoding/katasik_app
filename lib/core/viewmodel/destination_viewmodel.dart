import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:katasik_app/model/destination_model.dart';

import '../services/database.dart';

class DestinationViewModel extends GetxController {
  final List<DestinationModel> _destinations = [];

  List<DestinationModel> _foundDestination = [];

  final RxString? _address = RxString('');

  RxString? get address => _address;

  List<DestinationModel> get destinations => _destinations;

  List<DestinationModel> get foundDestination => _foundDestination;

  Future<Position> get getCurrentLocation => _getCurrentPosition();

  Future<void> get getAddress => _getAddress();

  Future<void> get distanceInKm => _distanceInKm();

  set setFoundDestination(List<DestinationModel> value) {
    _foundDestination = value;
  }

  Future<void> _getDestinations() async {
    // Fetching data from cloud firestore
    List<QueryDocumentSnapshot> destinationsSnapshot =
        await Database().fetchDestinations;

    // Looping destinationsSnapshot
    for (var destination in destinationsSnapshot) {
      // Add data from destinationsSnapshot to destinations
      destinations.add(
        // Parsing JSON destination
        DestinationModel.fromJson(
            destination.id, destination.data() as Map<String, dynamic>),
      );
    }
    update();
  }

  void filterDestination(String nameDestination) {
    // Create result variable
    List<DestinationModel> result = [];

    // Condition nameDestination is empety
    if (nameDestination.isEmpty) {
      result = destinations;

      // Condition nameDestination not empety
    } else {
      result = destinations
          .where(
            (element) => element.name.toString().toLowerCase().contains(
                  nameDestination.toLowerCase(),
                ),
          )
          .toList();
    }

    setFoundDestination = result;
    update();
  }

  Future<Position> _getCurrentPosition() async {
    try {
      // Request Permission Location
      await Geolocator.requestPermission();

      // Get Position
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      return position;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _getAddress() async {
    try {
      // Get location
      Position position = await getCurrentLocation;

      // Get placemark list from cordinates
      List<Placemark> placemarkList =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      // Get placemark
      Placemark placemark = placemarkList[0];

      // Get addrress
      String place =
          '${placemark.name}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.administrativeArea},';

      // Initialize adrress
      address!.value = place;
    } catch (e) {
      rethrow;
    }
    update();
  }

  Future<void> _distanceInKm() async {
    try {
      // Get data from firestore
      List<QueryDocumentSnapshot<Object?>> destinationSnapshot =
          await Database().fetchDestinations;

      // Parsing JSON destinationSnapshot
      var destinations = destinationSnapshot.map(
        (e) =>
            DestinationModel.fromJson(e.id, e.data() as Map<String, dynamic>),
      );

      // Get location, Calculate distance between and update distance
      for (var value in destinations) {
        Position position = await getCurrentLocation;

        double result = DestinationModel.distanceBetween(position.latitude,
            position.longitude, value.latitude, value.longitude);

        double distance = result / 1000;

        Database().destionationRef.doc(value.id).update({
          'distance': distance,
        });
      }
      update();
    } catch (e) {
      rethrow;
    }
  }

  @override
  void onInit() {
    _getDestinations();
    setFoundDestination = destinations;
    getAddress;
    distanceInKm;
    super.onInit();
  }
}
