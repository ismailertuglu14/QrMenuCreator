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

  @override
  Future<ResetPasswordCheckEmailResponseModel> checkEmail(
      {required ResetPasswordCheckRequestModel requestModel}) async {
    try {
      Response<dynamic> response = await dio.post(
          NetworkConstants.RESET_PASSWORD_CHECK_EMAIL,
          data: requestModel.toJson());
      if (response.statusCode == HttpStatus.ok) {
        return ResetPasswordCheckEmailResponseModel.fromJson(response.data);
      } else {
        throw Exception('Failed to  reset password');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ResetPasswordCheckOtpCodeResponseModel> checkOtpCode(
      {required ResetPasswordCheckOtpCodeRequestModel requestModel}) async {
    try {
      Response<dynamic> response = await dio.post(
          NetworkConstants.RESET_PASSWORD_CHECK_OTP_CODE,
          data: requestModel.toJson());
      if (response.statusCode == HttpStatus.ok) {
        return ResetPasswordCheckOtpCodeResponseModel.fromJson(response.data);
      } else {
        throw Exception('Failed to reset password');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ResetPasswordResponseModel> resetPassword(
      {required ResetPasswordRequestModel requestModel}) async {
    try {
      Response<dynamic> response = await dio
          .post(NetworkConstants.RESET_PASSWORD, data: requestModel.toJson());
      if (response.statusCode == HttpStatus.ok) {
        return ResetPasswordResponseModel.fromJson(response.data);
      } else {
        throw Exception('Failed to reset password');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
