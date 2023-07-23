import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qrmenu/core/constans/network/network_constants.dart';
import 'package:qrmenu/view/pages/createproduct/model/create_product_response_model.dart';
import 'package:qrmenu/view/pages/createproduct/service/ICreateProduct_service.dart';
import 'package:qrmenu/view/pages/createproduct/model/get_product_by_id_response_model.dart';

import '../../../../core/constans/cache/locale_keys_enum.dart';
import '../../../../core/init/cache/local_storage.dart';
import '../model/update_product_response_model.dart';

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
      required bool isActive,
      required List<Allergens> allergens,
      required List<Ingredient> ingredients,
      required List<Nutrition> nutritions}) async {
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
        "allergens": allergens,
        "isActive": isActive,
        "ingredients": ingredients,
        "nutritions": nutritions,
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

  @override
  Future<GetProductByIdResponseModel> getProductById(
      {required String productId}) async {
    try {
      Response<dynamic> response =
          await dio.get("${NetworkConstants.GET_PRODUCT_BY_ID}$productId");
      if (response.statusCode == HttpStatus.ok) {
        return GetProductByIdResponseModel.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      throw UnimplementedError(e.toString());
    }
  }

  @override
  Future<UpdateProductResponseModel> updateProduct(
      {required String productId,
      required String menuId,
      required String categoryId,
      required String name,
      required String description,
      required int price,
      required String currency,
      required List<XFile> files,
      required List<Ingredient> ingredients,
      required List<Allergens> allergens,
      required List<Nutrition> nutritions,
      required bool isActive}) async {
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
        "allergens": allergens,
        "images": images,
        "isActive": isActive,
        "ingredients": ingredients,
        "nutritions": nutritions,
      });

      Response<dynamic> response = await dio
          .put("${NetworkConstants.UPDATE_PRODUCT}$productId", data: formData);
      if (response.statusCode == HttpStatus.ok) {
        return UpdateProductResponseModel.fromJson(response.data);
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
