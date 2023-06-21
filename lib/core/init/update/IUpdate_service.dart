// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_version_update/app_version_update.dart';
import 'package:app_version_update/data/models/app_version_result.dart';
import 'package:dio/dio.dart';

abstract class IUpdateService {
  late final Dio dio;
  late final AppVersionUpdate appVersionUpdate;
  IUpdateService(this.dio, this.appVersionUpdate);
  Future<AppVersionResult> checkAppUpdate();
}
