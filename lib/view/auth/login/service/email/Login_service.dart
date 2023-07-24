// ignore_for_file: file_names, use_build_context_synchronously, deprecated_member_use

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/network/network_constants.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/view/auth/login/model/get_business_response_model.dart';
import 'package:qrmenu/view/auth/login/model/login_request_model.dart';
import 'package:qrmenu/view/auth/login/model/login_response_model.dart';
import '../../../../../core/constans/cache/locale_keys_enum.dart';
import '../../../../../core/constans/enum/route_keys.dart';
import '../../../../../core/extension/try_exception_extension.dart';

import '../../../../../core/init/cache/local_storage.dart';
import '../../../../../product/mixin/login_log_mixin.dart';
import 'ILogin_service.dart';

class LoginService extends ILoginService with LoginLogMixin {
  LoginService(super.dio);

  @override
  Future<LoginResponseModel> login(
      {required LoginRequestModel requestModel}) async {
    Response<dynamic> response =
        await dio.post(NetworkConstants.LOGIN, data: requestModel.toJson());
    try {
      Response<dynamic> response =
          await dio.post(NetworkConstants.LOGIN, data: requestModel.toJson());
      if (response.statusCode == HttpStatus.ok) {
        return LoginResponseModel.fromJson(response.data);
      } else {
        throw Exception("Login Error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<GetBusinessResponseModel> getBusiness() async {
    try {
      Response<dynamic> response = await dio.get(NetworkConstants.GET_BUSINESS);

      if (response.statusCode == HttpStatus.ok) {
        return GetBusinessResponseModel.fromJson(response.data);
      } else {
        throw Exception("Get Business Error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
