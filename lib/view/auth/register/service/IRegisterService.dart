// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/register_request_model.dart';
import '../model/register_response_model.dart';

abstract class IRegisterService {
  late final Dio dio;
  IRegisterService(this.dio);

  Future<RegisterResponseModel> register(BuildContext context,
      {required RegisterRequestModel requestModel});
}
