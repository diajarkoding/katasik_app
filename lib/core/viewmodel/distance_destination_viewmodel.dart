import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:katasik_app/helper/haversine/haversine_formula.dart';

class DistanceDestinationViewModel extends GetxController {
  Future<Position> get getCurrentLocation => _getCurrentLocation();
  Future<void> get getAddress => _getAddress();

  String? address = '';

  Future<Position> _getCurrentLocation() async {
    try {
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return position;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _getAddress() async {
    try {
      Position position = await getCurrentLocation;
      List<Placemark> snapshot =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = snapshot[0];
      address =
          '${place.name}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea},';
    } catch (e) {
      rethrow;
    }
    update();
  }

  Future<double> distanceInKm(double endLatitude, double endLongitude) async {
    try {
      Position position = await getCurrentLocation;
      double result = HaversineFormula().distanceBetween(
          position.latitude, endLatitude, position.longitude, endLongitude);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void onInit() {
    getAddress;
    super.onInit();
  }
}
