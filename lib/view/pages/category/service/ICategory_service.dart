// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../model/create_category_response_model.dart';

abstract class ICategoryService {
  late final Dio dio;
  ICategoryService(this.dio);
  Future<CreateCategoryResponseModel> createCategory(
      {required String menuId, required String name, required XFile image});
}
