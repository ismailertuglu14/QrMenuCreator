import 'package:dio/dio.dart';

import '../../category/model/get_category_request_model.dart';
import '../../createproduct/model/create_product_response_model.dart';
import '../model/get_products_by_menu_id_response_model.dart';

abstract class IProductSerrvice {
  late final Dio dio;

  IProductSerrvice(this.dio);

  Future<GetProductsByMenuIdResponseModel> getProductsByMenuId(
      {required GetCategoriesRequestModel requestModel});
}
