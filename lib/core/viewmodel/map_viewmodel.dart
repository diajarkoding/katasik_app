import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewModel extends GetxController {
  final CameraPosition initialLocation = const CameraPosition(
    target: LatLng(-7.4441451, 108.0759115),
    // target: LatLng(-7.3601468, 108.1706082),
    zoom: 9.7,
  );

  late GoogleMapController mapController;
}
