// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';


import '../model/reset_password_check_email_request_model.dart';
import '../model/reset_password_check_otp_code_request_model.dart';

abstract class IResetPasswordService {
  late final Dio dio;
  IResetPasswordService(this.dio);

 
}
