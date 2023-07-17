

import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/constans/network/network_constants.dart';
import '../model/change_social_media_request_model.dart';
import '../model/change_social_media_response_model.dart';
import 'ISocialMedias_service.dart';

class SocialMediasService extends ISocialMediasService {
  SocialMediasService(super.dio);

  @override
  Future<ChangeSocialMediaResponseModel> addSocialMedia(
      {required ChangeSocialMediaRequestModel requestModel}) async {
    try {
      Response<dynamic> response = await dio
          .post(NetworkConstants.ADD_SOCIAL_MEDIA, data: requestModel.toJson());

      if (response.statusCode == HttpStatus.ok) {
        return ChangeSocialMediaResponseModel.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      throw UnimplementedError(e.toString());
    }
  }
}
