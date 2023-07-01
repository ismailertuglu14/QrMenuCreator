import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LocationPickProvider extends ChangeNotifier {
  static LocationPickProvider? _instance;

  static LocationPickProvider get instance {
    _instance ??= LocationPickProvider._();
    return _instance!;
  }

  LocationPickProvider._() {
    _mapController = MapController();
  }
  LatLng? _currentLocation;
  late final MapController _mapController;

  double _zoom = 5;

  double get zoom => _zoom;

  LatLng? get currentLocation => _currentLocation;
  MapController get mapController => _mapController;

  void resetRotation() {
    _mapController.rotate(0);

    notifyListeners();
  }

  set setCurrentLocation(LatLng? value) {
    _currentLocation = value;

    notifyListeners();
  }

  void zoomIn() {
    print(_currentLocation);
    if (_currentLocation != null) {
      _zoom += 1;
      _mapController.move(_currentLocation!, _zoom);
      notifyListeners();
    }
  }

  void zoomOut() {
    if (_currentLocation != null) {
      _zoom -= 1;
      _mapController.move(_currentLocation!, _zoom);
      notifyListeners();
    }
  }
}
