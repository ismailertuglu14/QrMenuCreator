// ignore_for_file: file_names

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:qrmenu/core/constans/network/network_constants.dart';
import 'package:qrmenu/view/pages/category/model/get_category_request_model.dart';

import 'package:qrmenu/view/pages/createproduct/model/create_product_response_model.dart';
import 'package:qrmenu/view/pages/products/model/delete_product_request_model.dart';

import '../model/delete_product_response_model.dart';
import '../model/get_products_by_category_id_request_model.dart';
import '../model/get_products_by_category_id_response_model.dart';
import 'IProduct_service.dart';

class ProductService extends IProductSerrvice {
  ProductService(super.dio);

  @override
  Future<GetProductsByMenuIdResponseModel> getProductsByMenuId(
      {required GetProductsByCategoyIdRequestModel requestModel}) async {
    try {
      Response<dynamic> response = await dio.get(
          NetworkConstants.GET_RESTAURANT_PRODUCTS,
          data: requestModel.toJson());
      if (response.statusCode == HttpStatus.ok) {
        return GetProductsByMenuIdResponseModel.fromJson(response.data);
      } else {
        throw Exception("Bir hata oluştu");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<DeleteProductResponseModel> deleteProduct(
      {required DeleteProductRequestModel requestModel}) async {
    try {
      Response<dynamic> response = await dio
          .post(NetworkConstants.PRODUCT_DELETE, data: requestModel.toJson());
      if (response.statusCode == HttpStatus.ok) {
        return DeleteProductResponseModel.fromJson(response.data);
      } else {
        throw Exception("Bir hata oluştu");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
