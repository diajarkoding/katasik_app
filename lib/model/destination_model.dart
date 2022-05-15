import 'dart:math';

class DestinationModel {
  final String id;
  final String name;
  final String category;
  final String image;
  final String address;
  final String description;
  final List photos;
  final List facility;
  final double longitude;
  final double latitude;
  final double distance;

  DestinationModel({
    required this.id,
    required this.distance,
    required this.longitude,
    required this.latitude,
    required this.description,
    required this.photos,
    required this.facility,
    required this.name,
    required this.category,
    required this.image,
    required this.address,
  });

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) =>
      DestinationModel(
        id: id,
        longitude: json['longitude'],
        latitude: json['latitude'],
        description: json['description'],
        photos: json['photos'],
        facility: json['facility'],
        name: json['name'],
        category: json['category'],
        image: json['image'],
        address: json['address'],
        distance: json['distance'],
      );

  Map<String, dynamic> toJson() => {
        'distance': distance,
        'longitude': longitude,
        'latitude': latitude,
        'description': description,
        'photos': photos,
        'facility': facility,
        'category': category,
        'name': name,
        'image': image,
        'address': address,
      };

  static double distanceBetween(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
  ) {
    double earthRadius = 6378137.0;

    var dLat = _toRadians(endLatitude - startLatitude);

    var dLon = _toRadians(endLongitude - startLongitude);

    var x =
        (dLon) * cos((_toRadians(startLatitude) + _toRadians(endLatitude)) / 2);
    var y = dLat;

    var d = sqrt((x * x) + (y * y)) * earthRadius;

    return d;
  }

  static _toRadians(double degree) {
    return degree * pi / 180;
  }
}
