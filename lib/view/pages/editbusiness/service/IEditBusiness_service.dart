// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../model/change_cover_image_response_model.dart';
import '../../createproduct/model/get_product_by_id_response_model.dart';
import '../../socialmedias/model/change_social_media_request_model.dart';

import '../../socialmedias/model/change_social_media_response_model.dart';
import '../model/remove_cover_image_response_model.dart';
import '../model/update_business_response_model.dart';

abstract class IEditBusinessService {
  late final Dio dio;
  IEditBusinessService(this.dio);
  Future<ChangeCoverImageResponseModel> changeCoverImage({required XFile file});
 
  Future<UpdateBusinessResponseModel> updateBusiness({
    required String email,
    required String currency,
    required String countryCode,
    required String phoneNumber,
    
    required String businessName,
    required double latitude,
    required double longitude,
  });
}
