class DestinationModel {
  final String id;
  final String name;
  final String category;
  final String image;
  // final String jarak;
  final String address;
  final String description;
  final List photos;
  final List facility;
  final Map contact;
  final double longitude;
  final double latitude;

  DestinationModel({
    required this.id,
    required this.contact,
    // required this.kontak,
    required this.longitude,
    required this.latitude,
    required this.description,
    required this.photos,
    required this.facility,
    required this.name,
    required this.category,
    required this.image,
    // required this.jarak,
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
        contact: json['contact'],
      );

  Map<String, dynamic> toJson() => {
        'longitude': longitude,
        'latitude': latitude,
        'description': description,
        'photos': photos,
        'facility': facility,
        'category': category,
        'name': name,
        'image': image,
        'address': address,
        'contact': contact,
      };
}
