// ignore_for_file: file_names

import 'dart:io';

import 'package:app_version_update/app_version_update.dart';
import 'package:app_version_update/data/models/app_version_result.dart';
import 'package:dio/dio.dart';

import '../../constans/network/network_constants.dart';
import 'IUpdate_service.dart';
import 'model/check_update_response_model.dart';

class UpdateService extends IUpdateService {
  UpdateService(super.dio, super.appVersionUpdate);

  @override
  Future<AppVersionResult> checkAppUpdate() async {
    try {
      Response<dynamic> response =
          await dio.post(NetworkConstants.CHECK_UPDATE_VERSION);
      if (response.statusCode != HttpStatus.ok) {
        CheckUpdateResponseModel responseData =
            CheckUpdateResponseModel.fromJson(response.data);
        AppVersionResult result = await AppVersionUpdate.checkForUpdates(
          appleId: responseData.data.appleId,
          playStoreId: responseData.data.playStoreId,
          country: 'tr',
        );
        return result;
      } else {
        throw Exception('Check update error');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
