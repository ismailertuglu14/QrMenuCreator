// ignore_for_file: implementation_imports

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
      Response<dynamic> response = await dio.post(NetworkConstants.REGISTER,
          data: requestModel.toJson());

      if (response.statusCode == HttpStatus.ok) {
        return RegisterResponseModel.fromJson(response.data);
      } else {
        throw Exception('Failed to register');
      }
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
