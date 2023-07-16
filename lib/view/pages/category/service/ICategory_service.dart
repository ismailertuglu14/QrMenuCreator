// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qrmenu/view/pages/category/model/delete_category_response_model.dart';

import '../../dashboard/model/delete_menu_request_model.dart';
import '../model/create_category_response_model.dart';
import '../model/delete_category_request_model.dart';
import '../model/get_category_request_model.dart';
import '../model/get_category_response_model.dart';
import '../model/relocate_category_request_model.dart';
import '../model/relocate_category_response_model.dart';

abstract class ICategoryService {
  late final Dio dio;
  ICategoryService(this.dio);
  Future<CreateCategoryResponseModel> createCategory(
      {required String menuId, required String name, required XFile image});

  Future<GetCategoriesResponseModel> getCategories(
      {required GetCategoriesRequestModel requestModel});
  Future<DeleteCategoryResponseModel> deleteCategory(
      {required DeleteCategoryRequestModel requestModel});

  Future<RelocateCategoryResponseModel> relocateCategory(
      {required RelocateCategoryRequestModel requestModel});
}
