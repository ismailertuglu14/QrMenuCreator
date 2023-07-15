import '../../category/model/get_category_response_model.dart';
import '../../dashboard/model/get_restaurant_menus_response_model.dart';
import '../../products/model/get_products_by_category_id_response_model.dart';

 class BaseTemplateModel {
  final List<GetCategoriesData> categories;
  final List<GetProductsByMenuIdData> products;

  BaseTemplateModel(this.categories, this.products);
}
