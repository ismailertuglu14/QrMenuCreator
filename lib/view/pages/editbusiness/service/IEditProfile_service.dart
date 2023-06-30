// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../model/change_banner_image_response_model.dart';
import '../model/change_profile_image_response_model.dart';
import '../model/remove_banner_image_response_model.dart';
import '../model/remove_profile_image_response_model.dart';
import '../model/update_profile_request_model.dart';
import '../model/update_profile_response_model.dart';

abstract class IEditProfileService {
  late final Dio dio;
  IEditProfileService(this.dio);
  Future<void> changeCoverImage ({required FormData formData}) ;
}
