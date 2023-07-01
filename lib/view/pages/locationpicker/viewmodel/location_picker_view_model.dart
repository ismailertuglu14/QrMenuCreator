// ignore_for_file: use_build_context_synchronously

part of '../view/location_picker_view.dart';

abstract class LocationPickerViewModel extends State<LocationPickerView> {
  late final LocationPickProvider _locationPickProvider;
  late final EditBusinessProvider _editBusinessProvider;
  late final Dio _dio;
  late final LocationPickerService _locationPickerService;

  @override
  void initState() {
    super.initState();

    _locationPickProvider = LocationPickProvider.instance;
    _editBusinessProvider = EditBusinessProvider.instance;
    _dio = NetworkManager.instance.dio;
    _locationPickerService = LocationPickerService(_dio);

    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Location permission"),
                content: Text(
                    "Please allow location permission to use this feature"),
                actions: [
                  TextButton(
                      onPressed: () => context.pop(), child: Text("Cancel")),
                  TextButton(
                      onPressed: () async {
                        await Geolocator.requestPermission();

                        context.pop();
                      },
                      child: Text("Ok")),
                ],
              ));
    } else if (permission == LocationPermission.always) {
      _getCurrentLocation();
    }
  }

  Future<void> getLocationName() async {
    if (_locationPickProvider.currentLocation != null) {
      try {
        GetLocationNameResponseModel location =
            await _locationPickerService.getLocationName(
                currentLocation: _locationPickProvider.currentLocation!,
                lang: "tr");
        _editBusinessProvider
            .changeCurrentLocation(_locationPickProvider.currentLocation!);
        _editBusinessProvider.changeCurrentLocationName(
            "${location.locality}, ${location.city}, ${location.countryName}");
      } catch (e) {
        throw UnimplementedError(e.toString());
      }
    }
  }

  Future<void> _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always) {
      Fluttertoast.showToast(msg: 'Getting current location...');
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation,
          forceAndroidLocationManager: true);

      _locationPickProvider.setCurrentLocation = LatLng(
        position.latitude,
        position.longitude,
      );
    } else {
      Fluttertoast.showToast(msg: 'Denied location permission');
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Location permission"),
                content: Text(
                    "Please allow location permission to use this feature"),
                actions: [
                  TextButton(
                      onPressed: () => context.pop(), child: Text("Cancel")),
                  TextButton(
                      onPressed: () async {
                        await Geolocator.requestPermission();

                        context.pop();
                      },
                      child: Text("Ok")),
                ],
              ));
    }
  }
}
