// ignore_for_file: file_names, deprecated_member_use

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qrmenu/view/pages/socialmedias/model/change_social_media_request_model.dart';

import '../../../../core/constans/network/network_constants.dart';
import '../model/change_cover_image_response_model.dart';
import '../../createproduct/model/get_product_by_id_response_model.dart';

import '../../socialmedias/model/change_social_media_response_model.dart';
import '../model/remove_cover_image_response_model.dart';
import '../model/update_business_response_model.dart';
import 'IEditBusiness_service.dart';

class EditBusinessService extends IEditBusinessService {
  EditBusinessService(super.dio);

  @override
  Future<ChangeCoverImageResponseModel> changeCoverImage(
      {required XFile file}) async {
    try {
      FormData formData =
          FormData.fromMap({"image": await MultipartFile.fromFile(file.path)});

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



  @override
  Future<UpdateBusinessResponseModel> updateBusiness(
      {required String email,
      required String currency,
      required String countryCode,
      required String phoneNumber,
     
      required String businessName,
      required double latitude,
      required double longitude}) async {
    try {
      FormData formData = FormData.fromMap({
        "email": email,
        "currency": currency,
        "countryCode": countryCode,
        "phoneNumber": phoneNumber,
        "name": businessName,
        "latitude": latitude,
        "longitude": longitude,
        
      });

      Response<dynamic> response =
          await dio.post(NetworkConstants.UPDATE_BUSINESS, data: formData);

      if (response.statusCode == HttpStatus.ok) {
        return UpdateBusinessResponseModel.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      throw UnimplementedError(e.toString());
    }
  }
}
