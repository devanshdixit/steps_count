// ignore_for_file: avoid_print

import 'dart:math';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class Distance {
  List<LatLng> polylineCoordinates = [];
  Future calculateDistance(
      {required LatLng selectedPlac, required LatLng dropoffplac}) async {
    try {
      Position startCoordinates;
      Position destinationCoordinates;
      String _placeDistance;
      String _placeRate;
      // Use the retrieved coordinates of the current position,
      // instead of the address if the start position is user's
      // current position, as it results in better accuracy.
      startCoordinates = Position(
        latitude: selectedPlac.latitude,
        longitude: selectedPlac.longitude,
        accuracy: 0.0,
        altitude: 0.0,
        heading: 0.0,
        speed: 0.0,
        speedAccuracy: 0.0,
        timestamp: DateTime.now(),
      );
      destinationCoordinates = Position(
        latitude: dropoffplac.latitude,
        longitude: dropoffplac.longitude,
        accuracy: 0.0,
        altitude: 0.0,
        heading: 0.0,
        speed: 0.0,
        speedAccuracy: 0.0,
        timestamp: DateTime.now(),
      );

      print('START COORDINATES: $startCoordinates');
      print('DESTINATION COORDINATES: $destinationCoordinates');

      // ignore: unused_local_variable
      Position _northeastCoordinates;
      // ignore: unused_local_variable
      Position _southwestCoordinates;

      // Calculating to check that
      // southwest coordinate <= northeast coordinate
      if (startCoordinates.latitude <= destinationCoordinates.latitude) {
        _southwestCoordinates = startCoordinates;
        _northeastCoordinates = destinationCoordinates;
      } else {
        _southwestCoordinates = destinationCoordinates;
        _northeastCoordinates = startCoordinates;
      }

      // Calculating the distance between the start and the end positions
      // with a straight path, without considering any route
      double distanceInMeters = Geolocator.bearingBetween(
        startCoordinates.latitude,
        startCoordinates.longitude,
        destinationCoordinates.latitude,
        destinationCoordinates.longitude,
      );
      print('DISTANCE: $distanceInMeters meters');
      double totalDistance = 0.0;
      // Calculating the total distance by adding the distance
      // between small segments
      for (int i = 0; i < polylineCoordinates.length - 1; i++) {
        totalDistance += coordinateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i + 1].latitude,
          polylineCoordinates[i + 1].longitude,
        );
      }

      _placeDistance = totalDistance.toStringAsFixed(2);
      _placeRate = (totalDistance * 100).toStringAsFixed(2);
      print('DISTANCE: $_placeDistance km');
      print('DISTANCE: $_placeRate km');

      return {'placeDistance': _placeDistance, 'placeRate': _placeRate};
    } catch (e) {
      print(e);
      return {};
    }
  }

  double coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  Future getCurrentLocation() async {
    if (await Permission.location.request().isGranted) {
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((Position position) async {
        return position;
      }).catchError((e) {
        throw Exception(e);
      });
    }
  }
}
