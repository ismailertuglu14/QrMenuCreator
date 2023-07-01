// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';

import '../model/get_location_name_response_model.dart';

abstract class ILocationPickerService {
  late final Dio dio;
  ILocationPickerService(this.dio);

  Future<GetLocationNameResponseModel> getLocationName({required LatLng currentLocation,required String lang});
}


