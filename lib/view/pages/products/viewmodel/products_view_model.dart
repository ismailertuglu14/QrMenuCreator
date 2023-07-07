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
              requestModel: GetProductsByCategoyIdRequestModel(
        categoryId: widget.categoryId ?? "",
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

  Future<void> deleteProduct() async {
    try {
      _productsProvider.changeLoading();
      DeleteProductResponseModel response = await _productService.deleteProduct(
          requestModel: DeleteProductRequestModel(
              productId: _productsProvider.selectedProductId ?? ""));
      if (response.isSuccess && response.errors.isEmpty) {
        _productsProvider
            .removeProductItem(_productsProvider.selectedProductId ?? "");
      } else {
        Fluttertoast.showToast(msg: response.errors[0].message);
      }
    } catch (e) {
      throw Exception(e);
    } finally {
      _productsProvider.changeLoading();
    }
  }
}
