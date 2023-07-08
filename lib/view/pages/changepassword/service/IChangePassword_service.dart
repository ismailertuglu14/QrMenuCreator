// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import '../model/change_password_request_model.dart';
import '../model/change_password_response_model.dart';

abstract class IChangePasswordService {
  late final Dio dio;
  IChangePasswordService(this.dio);

  Future<ChangePasswordResponseModel> changePassword({required ChangePasswordRequestModel requestModel });
}
