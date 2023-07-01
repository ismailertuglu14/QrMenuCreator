// ignore_for_file: depend_on_referenced_packages

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:latlong2/latlong.dart';

Future<String> getLocationName(LatLng latLng) async {
  final url =
      'https://nominatim.openstreetmap.org/reverse?format=json&lat=${latLng.latitude}&lon=${latLng.longitude}';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    String displayName = data['display_name'];
    return displayName;
  }

  return '';
}
