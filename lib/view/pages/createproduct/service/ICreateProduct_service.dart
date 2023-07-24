// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qrmenu/view/pages/createproduct/model/create_product_response_model.dart';

import '../model/get_product_by_id_response_model.dart';
import '../model/update_product_response_model.dart';

abstract class ICreateProductService {
  late final Dio dio;
  ICreateProductService(this.dio);

  Future<CreateProductResponseModel> createProduct({
    required String menuId,
    required String categoryId,
    required String name,
    required String description,
    required int price,
    required String currency,
    required List allergens,
    required List nutritions,
    required List<XFile> files,
    required List<AddOns> addOns,
    required bool isActive,
  });

  Future<GetProductByIdResponseModel> getProductById(
      {required String productId});
  Future<UpdateProductResponseModel> updateProduct({
    required String productId,
    required String menuId,
    required String categoryId,
    required String name,
    required String description,
    required int price,
    required String currency,
    required List<Allergen> allergens,
    required List<XFile> files,
    required List<AddOns> addOns,
    required List<Nutrition> nutritions,
    required bool isActive,
  });
}
