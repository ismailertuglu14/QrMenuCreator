// ignore_for_file: use_build_context_synchronously

part of '../view/create_product_view.dart';

abstract class CreateProductViewModel extends State<CreateProductView> {
  late final ImagePicker _imagePicker;
  late final CreateProductService _createProductService;
  late final CreateProductProvider _createProductProvider;
  late final TextEditingController _nameController;
  late final TextEditingController _priceController;
  late final ProductsProvider _productsProvider;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _createProductService = CreateProductService(NetworkManager.instance.dio);
    _productsProvider = ProductsProvider.instance;
    _createProductProvider = CreateProductProvider.instance;
    _nameController = TextEditingController();
    _priceController = TextEditingController();
    _descriptionController = TextEditingController();

    _imagePicker = ImagePicker();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();

    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> createProduct() async {
    if (_nameController.text.isNotEmpty &&
        _priceController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      try {
        _createProductProvider.changeLoading();
        CreateProductResponseModel response =
            await _createProductService.createProduct(
          menuId: widget.menuId ?? "",
          categoryId: widget.categoryId ?? "",
          name: _nameController.text,
          description: _descriptionController.text,
          price: int.parse(_priceController.text),
          currency: "TL",
          files: _createProductProvider.itemPreviewList,
          ingredients: [
            ProductIngredient(
                name: "Gluten Free",
                isInclude: _createProductProvider.isGluetenFree),
            ProductIngredient(
                name: "Vegaterian",
                isInclude: _createProductProvider.isVegetarian),
            ProductIngredient(
                name: "Vegan", isInclude: _createProductProvider.isVegan),
            ProductIngredient(
                name: "Lactos Free",
                isInclude: _createProductProvider.isLactoseFree),
            ProductIngredient(
                name: "Halal", isInclude: _createProductProvider.isHalal),
          ],
        );
        if (response.isSuccess && response.errors.isEmpty) {
          _productsProvider.addProductItem(GetProductsByMenuIdData(
              id: response.data.id,
              name: response.data.name,
              description: response.data.description,
              price: response.data.price,
              currency: response.data.currency,
              images: response.data.images));
          context.pop();
          _nameController.clear();
          _priceController.clear();
          _descriptionController.clear();
          _createProductProvider.clearAll();
        }
      } catch (e) {
        _createProductProvider.changeLoading();
        throw Exception(e);
      }
    } else {
      Fluttertoast.showToast(msg: "Please enter a blank field");
    }
  }

  Future<void> uploadObject({required Object fileObject}) {
    List<XFile> file = fileObject as List<XFile>;
    _createProductProvider.addAllItemPreviewImage(file);

    return Future.value();
  }
}
