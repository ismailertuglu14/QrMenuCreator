// ignore_for_file: file_names, unused_import, depend_on_referenced_packages, library_prefixes

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart' show IOClient;


abstract class ILoginService {
  late final Dio dio;

  ILoginService(this.dio);

 
}
