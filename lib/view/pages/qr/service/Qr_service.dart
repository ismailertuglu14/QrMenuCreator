import 'dart:io';

import 'package:dio/dio.dart';
import 'package:qrmenu/core/constans/network/network_constants.dart';
import 'package:qrmenu/view/pages/qr/model/publish_unpublish_menu_response_model.dart';

import 'IQr_service.dart';

class QrService extends IQrService {
  QrService(super.dio);

  @override
  Future<PublishUnpublishMenuResponseModel> publishUnpublishMenu(
      {required String menuId}) async {
    try {
      Response<dynamic> response =
          await dio.post("${NetworkConstants.PUBLISH_UNPUBLISH_MENU}$menuId");
      if (response.statusCode == HttpStatus.ok) {
        return PublishUnpublishMenuResponseModel.fromJson(response.data);
      } else {
        throw Exception("Publish Unpublish Menu Error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
