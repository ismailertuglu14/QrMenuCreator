import 'package:dio/dio.dart';

import '../model/change_social_media_request_model.dart';
import '../model/change_social_media_response_model.dart';

abstract class ISocialMediasService {
  late final Dio dio;
  ISocialMediasService(this.dio);
  Future<ChangeSocialMediaResponseModel> addSocialMedia(
      {required ChangeSocialMediaRequestModel requestModel});
}
