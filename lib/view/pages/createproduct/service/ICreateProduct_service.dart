// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qrmenu/view/pages/createproduct/model/create_product_response_model.dart';

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
    required List<XFile> files,
    required List<Ingredients> ingredients,
    required bool isActive,
  });
}
