// ignore_for_file: file_names, deprecated_member_use

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constans/network/network_constants.dart';
import '../model/change_cover_image_response_model.dart';
import '../model/remove_banner_image_response_model.dart';
import '../model/remove_cover_image_response_model.dart';
import 'IEditBusiness_service.dart';

class EditBusinessService extends IEditBusinessService {
  EditBusinessService(super.dio);


  
  @override
  Future<ChangeCoverImageResponseModel> changeCoverImage(
      {required XFile file}) async {
    try {
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path),
      });
      Response<dynamic> response =
          await dio.post(NetworkConstants.CHANGE_COVER_IMAGE, data: formData);
      if (response.statusCode == HttpStatus.ok) {
        return ChangeCoverImageResponseModel.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      throw UnimplementedError(e.toString());
    }
  }
}
