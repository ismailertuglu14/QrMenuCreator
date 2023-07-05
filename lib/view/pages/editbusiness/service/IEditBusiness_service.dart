// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../model/change_banner_image_response_model.dart';
import '../model/change_cover_image_response_model.dart';
import '../model/remove_banner_image_response_model.dart';
import '../model/remove_cover_image_response_model.dart';



abstract class IEditBusinessService {
  late final Dio dio;
  IEditBusinessService(this.dio);
  Future<ChangeCoverImageResponseModel> changeCoverImage ({required XFile file}) ;
}
