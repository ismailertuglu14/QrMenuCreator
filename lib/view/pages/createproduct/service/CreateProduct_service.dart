import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
      required List<AddOns> addOns,
      required bool isActive,
      required List allergens,
      required List nutritions}) async {
    try {
      final List<MultipartFile> images = files
          .map(
              (img) => MultipartFile.fromFileSync(img.path, filename: img.path))
          .toList();
      final FormData formData = FormData.fromMap({
        "menuId": menuId,
        "categoryId": categoryId,
        "name": "name",
        "description": "description",
        "price": 50,
        "currency": "TL",
        "images": [],
        "isActive": true,
        "addOns": [
          {"name": "Protein", "description": "1", "price": 10},
          {"name": "Carbs", "description": "2", "price": 20},
          {"name": "Fats", "description": "3", "price": 30},
          {"name": "Fibre", "description": "4", "price": 40}
        ],
        "allergens": [
          {"name": "Molluscs", "isAllergen": true}
        ],
        "nutritions": [
          {"name": "Protein", "value": 10},
          {"name": "Carbs", "value": 20},
          {"name": "Fats", "value": 30},
          {"name": "Fibre", "value": 40}
        ],
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
        throw Exception("Failed to load data");
      }
    } catch (e) {
      throw Exception(e);
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
      required List<AddOns> addOns,
      required List<XFile> files,
      required List allergens,
      required List nutritions,
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
        "images": images,
        "isActive": isActive,
        "addOns": addOns,
        "allergens": allergens,
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
