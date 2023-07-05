import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qrmenu/core/constans/network/network_constants.dart';
import 'package:qrmenu/view/pages/createproduct/model/create_product_response_model.dart';
import 'package:qrmenu/view/pages/createproduct/service/ICreateProduct_service.dart';

import '../../../../core/constans/cache/locale_keys_enum.dart';
import '../../../../core/init/cache/local_storage.dart';

class CreateProductService extends ICreateProductService {
  CreateProductService(super.dio);

  @override
  Future<CreateProductResponseModel> createProduct(
      {required String menuId,
      required String categoryId,
      required String name,
      required String description,
      required int price,
      required String currency,
      required List<XFile> files,
      required List<ProductIngredient> ingredients}) async {
    try {
      final List<MultipartFile> images = files
          .map((img) => MultipartFile.fromFileSync(img.path,
              filename: img.path.split('/').last))
          .toList();
      FormData formData = FormData.fromMap({
        "menuId": menuId,
        "categoryId": categoryId,
        "name": name,
        "description": description,
        "price": price,
        "currency": currency,
        "images": images,
        "ingredients": ingredients
      });
      Response<dynamic> response =
          await dio.post(NetworkConstants.CREATE_PRODUCT, data: formData);
      if (response.statusCode == HttpStatus.ok) {
       
        return CreateProductResponseModel.fromJson(response.data);
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
