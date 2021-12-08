import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:steps_count/helpers.dart';

const double CAMERA_ZOOM = 17;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;

class BackMap extends StatefulWidget {
  BackMap({
    Key? key,
  }) : super(key: key);
  @override
  _BackMapState createState() => _BackMapState();
}

class _BackMapState extends State<BackMap> {
  Completer<GoogleMapController> _controller = Completer();

  late Location location;

  CameraPosition initialLocation = CameraPosition(
    zoom: CAMERA_ZOOM,
    bearing: CAMERA_BEARING,
    tilt: CAMERA_TILT,
    target: LatLng(42.6871386, -71.2143403),
  );

  LatLng currentLocation = const LatLng(42.6871386, -71.2143403);
  Position _currentPosition = Position(
      longitude: 42.6871386,
      latitude: -71.2143403,
      timestamp: DateTime.now(),
      accuracy: 10.0,
      altitude: 1000,
      heading: 0.0,
      speed: 0.0,
      speedAccuracy: 10);
  late StreamSubscription<LocationData> locationData;

  @override
  void initState() {
    super.initState();

    beforeInitailtion();
  }

  void beforeInitailtion() async {
    final position = await Distance().getCurrentLocation();
    if (position != null) {
      setState(() {
        _currentPosition = position;
      });
    }
    setState(() {
      currentLocation =
          LatLng(_currentPosition.latitude, _currentPosition.longitude);
    });
    initialLocation = CameraPosition(
      zoom: 10,
      bearing: CAMERA_BEARING,
      tilt: CAMERA_TILT,
      target: currentLocation,
    );

    print('object2');
    location = Location();
    locationData =
        location.onLocationChanged.listen((LocationData? cLoc) async {
      if (cLoc != null) {
        print('location changed');

        updatePinOnMap(location: currentLocation, completer: _controller);
        final distance = calculateDistance(currentLocation.latitude,
            currentLocation.longitude, cLoc.latitude, cLoc.longitude);
        if (distance > 0.016) {
          setState(() {
            currentLocation = LatLng(cLoc.latitude!, cLoc.longitude!);
          });
        }
      }
    });
    print('object1');
    setState(() {
      maploading = false;
    });
  }

  @override
  void dispose() {
    locationData.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return maploading
        ? const LoadingScrren()
        : GoogleMap(
            myLocationEnabled: true,
            compassEnabled: true,
            tiltGesturesEnabled: false,
            mapType: MapType.normal,
            initialCameraPosition: initialLocation,
            onMapCreated: (controller) {
              onMapCreated(controller, _controller);
            },
          );
  }

  bool maploading = true;

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  updatePinOnMap(
      {required LatLng location,
      required Completer<GoogleMapController> completer}) async {
    CameraPosition cPosition = CameraPosition(
      zoom: CAMERA_ZOOM,
      tilt: CAMERA_TILT,
      bearing: CAMERA_BEARING,
      target: LatLng(location.latitude, location.longitude),
    );
    final GoogleMapController controller = await completer.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cPosition));
    print('databse updaeted');
  }

  void onMapCreated(GoogleMapController controller,
      Completer<GoogleMapController> _controller) {
    if (!_controller.isCompleted) {
      _controller.complete(controller);
    }
  }
}

class LoadingScrren extends StatelessWidget {
  const LoadingScrren({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
