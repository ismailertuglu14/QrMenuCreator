// ignore_for_file: file_names, use_build_context_synchronously, deprecated_member_use

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../product/mixin/login_log_mixin.dart';
import 'ILogin_service.dart';

class LoginService extends ILoginService with LoginLogMixin {
  LoginService(super.dio);
}
