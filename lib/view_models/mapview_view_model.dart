import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';

class MapViewViewModel extends ChangeNotifier {
  final String title;
  final String address;
  final double latitude;
  final double longitude;

  late MapController _mapController;
  bool _permissionGranted = false;

  MapViewViewModel({
    required this.title,
    required this.address,
    required this.latitude,
    required this.longitude,
  }) {
    _mapController = MapController();
    checkLocationPermission();
  }

  MapController get mapController => _mapController;
  bool get permissionGranted => _permissionGranted;
  LatLng get position => LatLng(latitude, longitude);

  Future<void> checkLocationPermission() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      _permissionGranted = true;
      notifyListeners();
    }
  }
}
