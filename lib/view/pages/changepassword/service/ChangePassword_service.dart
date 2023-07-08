import 'dart:io';

import 'package:dio/dio.dart';
import 'package:qrmenu/core/constans/network/network_constants.dart';
import 'package:qrmenu/view/pages/changepassword/service/IChangePassword_service.dart';

import '../model/change_password_request_model.dart';
import '../model/change_password_response_model.dart';

class ChangePasswordService extends IChangePasswordService {
  ChangePasswordService(super.dio);

  @override
  Future<ChangePasswordResponseModel> changePassword(
      {required ChangePasswordRequestModel requestModel}) async {
    try {
      Response<dynamic> response = await dio
          .put(NetworkConstants.CHANGE_PASSWORD, data: requestModel.toJson());
      if (response.statusCode == HttpStatus.ok) {
        return ChangePasswordResponseModel.fromJson(response.data);
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
