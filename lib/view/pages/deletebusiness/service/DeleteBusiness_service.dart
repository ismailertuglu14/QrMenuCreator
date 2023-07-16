import 'dart:io';

import 'package:dio/dio.dart';
import 'package:qrmenu/core/constans/network/network_constants.dart';

import '../model/delete_business_request_model.dart';
import '../model/delete_business_response_model.dart';
import 'IDeleteBusiness_service.dart';

class DeleteBusinessService extends IDeleteBusinessService {
  DeleteBusinessService(super.dio);

  @override
  Future<DeleteBusinessResponseModel> deleteBusiness(
      {required DeleteBusinessRequestModel requestModel}) async {
    try {
      Response<dynamic> response = await dio
          .post(NetworkConstants.DELETE_BUSINESS, data: requestModel.toJson());
     
      if (response.statusCode == HttpStatus.ok) {
        return DeleteBusinessResponseModel.fromJson(response.data);
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
