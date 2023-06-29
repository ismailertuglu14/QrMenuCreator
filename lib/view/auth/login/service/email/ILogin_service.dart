// ignore_for_file: file_names, unused_import, depend_on_referenced_packages, library_prefixes

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart' show IOClient;
import 'package:qrmenu/view/auth/login/model/login_response_model.dart';

import '../../model/login_request_model.dart';

abstract class ILoginService {
  late final Dio dio;

  ILoginService(this.dio);

  Future<LoginResponseModel> login({required LoginRequestModel requestModel});
}
