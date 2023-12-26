import 'dart:io';

class PlaceLocation {
  final double latitude;
 final double longitude;
 final String? address;

  PlaceLocation({required this.latitude,required this.longitude, this.address});
}

class Place {
  String id;
  String title;
  PlaceLocation? location;
  File image;

  Place(
      {required this.id,
      required this.title,
      required this.location,
      required this.image});
}
