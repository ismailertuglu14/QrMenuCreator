// ignore_for_file: file_names

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qrmenu/core/constans/network/network_constants.dart';
import 'package:qrmenu/view/pages/category/service/ICategory_service.dart';

import '../../../../core/constans/cache/locale_keys_enum.dart';
import '../../../../core/init/cache/local_storage.dart';
import '../model/create_category_response_model.dart';

class CategoryService extends ICategoryService {
  CategoryService(super.dio);

  @override
  Future<CreateCategoryResponseModel> createCategory(
      {required String menuId,
      required String name,
      required XFile image}) async {
    try {
      FormData formData = FormData.fromMap({
        "menuId": menuId,
        "name": name,
        "image": await MultipartFile.fromFile(image.path),
      });
      Response<dynamic> response =
          await dio.post(NetworkConstants.CREATE_CATEGORY, data: formData);
      if (response.statusCode == HttpStatus.ok) {
        return CreateCategoryResponseModel.fromJson(response.data);
      } else {
        throw Exception("Bir hata oluştu");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
