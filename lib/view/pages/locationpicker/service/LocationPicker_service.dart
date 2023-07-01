// ignore_for_file: file_names

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';
import 'package:qrmenu/core/constans/network/network_constants.dart';
import 'package:qrmenu/view/pages/locationpicker/service/ILocationPicker_service.dart';

import '../model/get_location_name_response_model.dart';

class LocationPickerService extends ILocationPickerService {
  LocationPickerService(super.dio);

  @override
  Future<GetLocationNameResponseModel> getLocationName(
      {required LatLng currentLocation, required String lang}) async {
    try {
      Response<dynamic> response = await dio.get(
        "${NetworkConstants.GET_LOCATION_NAME}latitude=${currentLocation.latitude}&longitude=${currentLocation.longitude}&localityLanguage=$lang",
      );
      if (response.statusCode == HttpStatus.ok) {
        return GetLocationNameResponseModel.fromJson(response.data);
      } else {
        throw Exception('Location name could not be found');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
