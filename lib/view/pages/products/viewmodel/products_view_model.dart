part of '../view/products_view.dart';

abstract class ProductsViewModel extends State<ProductsView> {
  late final ProductsProvider _productsProvider;
  late final ProductService _productService;

  @override
  void initState() {
    super.initState();
    _productsProvider = ProductsProvider.instance;
    _productService = ProductService(NetworkManager.instance.dio);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getProductsByMenuId();
    });
  }

  Future<void> getProductsByMenuId() async {
    try {
      _productsProvider.changeLoading();

      GetProductsByMenuIdResponseModel response =
          await _productService.getProductsByMenuId(
              requestModel: GetCategoriesRequestModel(
        menuId: "64a53b0a46a0b8151f9ce55f",
      ));
      if (response.isSuccess && response.errors.isEmpty) {
        _productsProvider.setProductList = response.data;
      }
    } catch (e) {
      throw Exception(e);
    } finally {
      _productsProvider.changeLoading();
    }
  }
}
