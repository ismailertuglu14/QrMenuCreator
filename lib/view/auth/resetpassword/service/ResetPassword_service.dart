// ignore_for_file: file_names

import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/constans/network/network_constants.dart';
import '../model/reset_password_check_email_request_model.dart';
import '../model/reset_password_check_email_response_model.dart';
import '../model/reset_password_check_otp_code_request_model.dart';
import '../model/reset_password_check_otp_code_response_model.dart';
import '../model/reset_password_request_model.dart';
import '../model/reset_password_response_model.dart';
import 'IResetPassword_service.dart';

class ResetPasswordService extends IResetPasswordService {
  ResetPasswordService(super.dio);

 

}
