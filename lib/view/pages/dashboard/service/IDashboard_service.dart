import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qrmenu/view/pages/dashboard/model/get_restaurant_menus_response_model.dart';

import '../model/create_menu_response_model.dart';
import '../model/delete_menu_request_model.dart';
import '../model/delete_restaurant_response_model.dart';

abstract class IDashboardService {
  late final Dio dio;
  IDashboardService(this.dio);

  Future<GetRestaurantMenusResponseModel> getRestaurantMenus();

  Future<CreateMenuResponseModel> createMenu(
      {required String name, required XFile imageFile});
  Future<DeleteRestaurantMenusResponseModel> deleteRestaurantMenu(
      {required DeleteMenuRequestModel resquestModel});
}
