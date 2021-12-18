import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  Position _currentPosition = const Position(
    longitude: 51.457838,
    latitude: -0.596342,
    accuracy: 0.0,
    altitude: 0.0,
    heading: 0.0,
    speed: 0.0,
    speedAccuracy: 0.0,
    timestamp: null,
  );
  Position get currentPosition => _currentPosition;

  Future getCurrentLocation() async {
    if (await Permission.location.request().isGranted) {
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((Position position) async {
        _currentPosition = position;
      }).catchError((e) {
        throw Exception(e);
      });
    }
  }

  getUserLocation() async {
    //call this async method from whereever you need

    Position myLocation = _currentPosition;
    String error;
    try {
      await getCurrentLocation();
      myLocation = _currentPosition;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'please grant permission';
        throw Exception(error);
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'permission denied- please enable it from app settings';
        throw Exception(error);
      }
    }
    var addresses = await placemarkFromCoordinates(
        myLocation.latitude, myLocation.longitude);
    var first = addresses.first;
    return first;
  }
}
