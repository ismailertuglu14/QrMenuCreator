// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import '../model/publish_unpublish_menu_response_model.dart';

abstract class IQrService {
  late final Dio dio;
  IQrService(this.dio);

  Future<PublishUnpublishMenuResponseModel> publishUnpublishMenu(
      {required String menuId});
}
