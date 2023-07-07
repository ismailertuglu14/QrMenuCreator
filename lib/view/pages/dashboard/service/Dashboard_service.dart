// ignore_for_file: file_names

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:qrmenu/core/constans/network/network_constants.dart';
import 'package:qrmenu/view/pages/dashboard/model/create_menu_request_model.dart';
import 'package:qrmenu/view/pages/dashboard/model/create_menu_response_model.dart';
import 'package:qrmenu/view/pages/dashboard/model/delete_menu_request_model.dart';
import 'package:qrmenu/view/pages/dashboard/model/delete_restaurant_response_model.dart';
import 'package:qrmenu/view/pages/dashboard/model/get_restaurant_menus_response_model.dart';
import 'package:qrmenu/view/pages/dashboard/service/IDashboard_service.dart';

import '../../../../core/constans/cache/locale_keys_enum.dart';
import '../../../../core/init/cache/local_storage.dart';

class DashboardService extends IDashboardService {
  DashboardService(super.dio);

  @override
  Future<GetRestaurantMenusResponseModel> getRestaurantMenus() async {
    try {
      Response<dynamic> response =
          await dio.get(NetworkConstants.GET_RESTAURANT_MENUS);

      if (response.statusCode == HttpStatus.ok) {
        return GetRestaurantMenusResponseModel.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<CreateMenuResponseModel> createMenu(
      {required CreateMenuResquestModel resquestModel}) async {
    try {
      Response<dynamic> response = await dio.post(NetworkConstants.CREATE_MENU,
          data: resquestModel.toJson());

      if (response.statusCode == HttpStatus.ok) {
        return CreateMenuResponseModel.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<DeleteRestaurantMenusResponseModel> deleteRestaurantMenu(
      {required DeleteMenuRequestModel resquestModel}) async {
    try {
      Response<dynamic> response = await dio.post(NetworkConstants.MENU_DELETE,
          data: resquestModel.toJson());

      if (response.statusCode == HttpStatus.ok) {
        return DeleteRestaurantMenusResponseModel.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
