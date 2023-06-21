// ignore_for_file: implementation_imports, deprecated_member_use

import 'dart:io';
import 'package:dio/dio.dart';

import 'package:flutter/src/widgets/framework.dart';

import '../../../../core/constans/cache/locale_keys_enum.dart';
import '../../../../core/constans/network/network_constants.dart';
import '../model/register_request_model.dart';
import '../model/register_response_model.dart';
import 'IRegisterService.dart';

class RegisterService extends IRegisterService {
  RegisterService(super.dio);

  @override
  Future<RegisterResponseModel> register(BuildContext context,
      {required RegisterRequestModel requestModel}) async {
    try {
      Response<dynamic> response = await dio
          .post(NetworkConstants.SIGN_OUT_USER, data: requestModel.toJson());

      if (response.statusCode == HttpStatus.ok && response.data != null) {
        RegisterResponseModel registerResponse =
            RegisterResponseModel.fromJson(response.data);

        return registerResponse;
      } else {
        throw Exception('Failed to register');
      }
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
