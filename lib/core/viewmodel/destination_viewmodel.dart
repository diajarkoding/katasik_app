import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:katasik_app/model/destination_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/database.dart';

class DestinationViewModel extends GetxController {
  List<double> listDistance = [];

  final List<DestinationModel> _destinations = [];

  List<DestinationModel> _foundDestination = [];

  List<DestinationModel> _destiByCategory = [];

  final RxString? _address = RxString('');

  bool _isLoading = false;

  final RxBool _loading = false.obs;

  Position? _myLocation;

  Position? get myLocation => _myLocation;

  bool get isLoading => _isLoading;

  RxBool get loading => _loading;

  RxString? get address => _address;

  List<DestinationModel> get destinations => _destinations;

  List<DestinationModel> get foundDestination => _foundDestination;

  List<DestinationModel> get destiByCategory => _destiByCategory;

  set setMyLocation(Position value) {
    _myLocation = value;
  }

  // Map<String, dynamic>? deterMine;

  // Future<Map<String, dynamic>> determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return {'error': true, 'message': 'Layanan Lokasi dinonaktifkan'};
  //   }

  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.deniedForever) {
  //     return {
  //       'error': true,
  //       'message':
  //           'Izin lokasi ditolak secara permanen. kami tidak dapat meminta izin'
  //     };
  //   }

  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();

  //     if (permission == LocationPermission.whileInUse &&
  //         permission == LocationPermission.always) {
  //       return {'error': true, 'message': 'Izin lokasi ditolak'};
  //     }
  //     return {'error': true, 'message': 'Izin lokasi ditolak'};
  //   }

  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   return {
  //     'position': position,
  //     'error': false,
  //     'message': 'Posisi berhasil di ambil'
  //   };
  // }

  // Future<void> deterjen() async {
  //   Map<String, dynamic> response = await determinePosition();
  //   deterMine = response;
  //   update();
  // }

  Future<void> _getDestinations() async {
    _isLoading = true;

    // Fetching data from cloud firestore
    List<QueryDocumentSnapshot> destinationsSnapshot =
        await Database.fetchDestinations;

    // Looping destinationsSnapshot
    for (var destination in destinationsSnapshot) {
      // Add data from destinationsSnapshot to destinations
      destinations.add(
        // Parsing JSON destination
        DestinationModel.fromJson(
            destination.id, destination.data() as Map<String, dynamic>),
      );
    }

    Future.delayed(const Duration(milliseconds: 500), () {
      _isLoading = false;
    });

    update();
  }

  void filterDestination(String nameDestination) {
    _isLoading = true;

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

    _foundDestination = result;

    _isLoading = false;
    update();
  }

  void filterByCategory(String category) {
    // Create result variable
    List<DestinationModel> result = [];

    // Condition category is empety

    result = destinations
        .where(
          (element) => element.category.toString().toLowerCase().contains(
                category.toLowerCase(),
              ),
        )
        .toList();

    _destiByCategory = result;

    _isLoading = false;
    update();
  }

  Future<Position> determinePosition() async {
    // Request Permission Location
    await Geolocator.requestPermission();

    // Get Location / Position
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  Future<void> _getMyLoaction() async {
    try {
      // Get Position
      Position position = await determinePosition();

      setMyLocation = position;
    } catch (e) {
      rethrow;
    }
  }

  // Future<void> _getMyLoaction2() async {
  //   try {
  //     Map<String, dynamic> response = await determinePosition();

  //     if (!response['error']) {
  //       setMyLocation = response['position'];
  //       update();
  //       print(response['message']);
  //       Get.snackbar('Berhasil', response['message']);
  //     } else {
  //       print(response['message']);
  //       Get.snackbar('Terjadi Kesalahan', response['message']);
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<void> _getAddress() async {
    try {
      _loading.value = true;

      // Get placemark list from cordinates
      List<Placemark> placemarkList = await placemarkFromCoordinates(
          myLocation!.latitude, myLocation!.longitude);

      // Get placemark
      Placemark placemark = placemarkList[0];

      // Get addrress
      String place =
          '${placemark.name}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.administrativeArea},';

      // Initialize adrress
      address!.value = place;

      _loading.value = false;
    } catch (e) {
      rethrow;
    }
    update();
  }

  // Future<void> _distanceInKm() async {
  //   try {
  //     _isLoading = true;

  //     // Get data from firestore
  //     List<QueryDocumentSnapshot<Object?>> destinationSnapshot =
  //         await Database.fetchDestinations;

  //     // Parsing JSON destinationSnapshot
  //     var destinations = destinationSnapshot.map(
  //       (e) =>
  //           DestinationModel.fromJson(e.id, e.data() as Map<String, dynamic>),
  //     );

  //     // Get location, Calculate distance between and update distance
  //     for (var value in destinations) {
  //       double result = DestinationModel.distanceBetween(myLocation!.latitude,
  //           myLocation!.longitude, value.latitude, value.longitude);

  //       double distance = result / 1000;

  //       Database.destionationRef.doc(value.id).update({
  //         'distance': distance,
  //       });
  //     }

  //     _isLoading = false;
  //     update();
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<void> _distanceInKm() async {
    try {
      _isLoading = true;

      // Get data from firestore
      List<QueryDocumentSnapshot<Object?>> destinationSnapshot =
          await Database.fetchDestinations;

      // Parsing JSON destinationSnapshot
      var destinations = destinationSnapshot.map(
        (e) =>
            DestinationModel.fromJson(e.id, e.data() as Map<String, dynamic>),
      );

      // Get location, Calculate distance between and update distance
      for (var value in destinations) {
        double result = DestinationModel.distanceBetween(myLocation!.latitude,
            myLocation!.longitude, value.latitude, value.longitude);

        double distance = result / 1000;

        listDistance.add(distance);
      }

      _isLoading = false;
      update();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> goToMap(String url) async {
    final linkUrl = url;
    try {
      if (await canLaunch(linkUrl)) {
        await launch(
          url,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await _getMyLoaction();
    _getDestinations();
    _foundDestination = destinations;
    _getAddress();
    _distanceInKm();
    // filterDestination('gunung');
  }
}
