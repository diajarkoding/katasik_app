// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:katasik_app/core/services/database.dart';
import 'package:katasik_app/model/destination_model.dart';

class MapViewModel extends GetxController {
  final List<Map<String, dynamic>> listLatLang = [];

  late GoogleMapController mapController;

  late Position currentPosition;

  final CameraPosition initialLocation = const CameraPosition(
    target: LatLng(-7.4441451, 108.0759115),
    zoom: 9.7,
  );

  Future<void> _getCurrentLocation() async {
    // Request Permission Location
    await Geolocator.requestPermission();

    // Get Location / Position
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition = position;
      print('CURRENT POS: $currentPosition');

      // Update Camera Position
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 18.0,
          ),
        ),
      );
    }).catchError((e) {
      print(e);
    });
  }

  Marker customMarker(LatLng e, String title) {
    return Marker(
      markerId: MarkerId(e.hashCode.toString()),
      position: e,
      infoWindow: InfoWindow(title: title),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    );
  }

  Future<void> addLatLang() async {
    // Get data from firestore
    List<QueryDocumentSnapshot<Object?>> destinationSnapshot =
        await Database().fetchDestinations;

    // Convert / Parsing JSON destinationSnapshot to DestinationModel
    var destinations = destinationSnapshot.map(
      (e) => DestinationModel.fromJson(e.id, e.data() as Map<String, dynamic>),
    );

    // add latitude and longitude from destinations to listLatLang
    for (var value in destinations) {
      LatLng latLang = LatLng(value.latitude, value.longitude);
      String title = value.name;
      listLatLang.add(
        {'position': latLang, 'title': title},
      );
    }

    update();
  }

  @override
  void onInit() {
    _getCurrentLocation();
    addLatLang();
    super.onInit();
  }
}
