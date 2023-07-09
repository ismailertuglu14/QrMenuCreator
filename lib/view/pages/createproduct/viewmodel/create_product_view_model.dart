// ignore_for_file: use_build_context_synchronously, deprecated_member_use

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
    WidgetsBinding.instance.addPostFrameCallback((_) => getProductById());
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
          isActive: _createProductProvider.isActive,
          files: _createProductProvider.itemPreviewList,
          nutritions: [
            Nutrition(name: "Protein", value: _createProductProvider.protein),
            Nutrition(
                name: "Carbs", value: _createProductProvider.carbohydrate),
            Nutrition(name: "Fats", value: _createProductProvider.fat),
            Nutrition(name: "Fibre", value: _createProductProvider.fibre),
          ],
          ingredients: [
            Ingredient(
                name: "Gluten Free",
                isInclude: _createProductProvider.isGluetenFree),
            Ingredient(
                name: "Vegaterian",
                isInclude: _createProductProvider.isVegetarian),
            Ingredient(
                name: "Vegan", isInclude: _createProductProvider.isVegan),
            Ingredient(
                name: "Lactos Free",
                isInclude: _createProductProvider.isLactoseFree),
            Ingredient(
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
              images: response.data.images.first));
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

  Future<void> updateProduct() async {
    if (_nameController.text.isNotEmpty &&
        _priceController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      try {
        _createProductProvider.changeLoading();

        UpdateProductResponseModel response =
            await _createProductService.updateProduct(
          productId: widget.productId ?? "",
          menuId: widget.menuId ?? "",
          categoryId: widget.categoryId ?? "",
          name: _nameController.text,
          description: _descriptionController.text,
          price: int.parse(_priceController.text),
          currency: "TL",
          isActive: _createProductProvider.isActive,
          files: _createProductProvider.itemPreviewList,
          nutritions: [
            Nutrition(name: "Protein", value: _createProductProvider.protein),
            Nutrition(
                name: "Carbs", value: _createProductProvider.carbohydrate),
            Nutrition(name: "Fats", value: _createProductProvider.fat),
            Nutrition(name: "Fibre", value: _createProductProvider.fibre),
          ],
          ingredients: [
            Ingredient(
                name: "Gluten Free",
                isInclude: _createProductProvider.isGluetenFree),
            Ingredient(
                name: "Vegaterian",
                isInclude: _createProductProvider.isVegetarian),
            Ingredient(
                name: "Vegan", isInclude: _createProductProvider.isVegan),
            Ingredient(
                name: "Lactos Free",
                isInclude: _createProductProvider.isLactoseFree),
            Ingredient(
                name: "Halal", isInclude: _createProductProvider.isHalal),
          ],
        );

        if (response.isSuccess && response.errors.isEmpty) {
          _productsProvider.updateProductItem(GetProductsByMenuIdData(
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

  Future<void> getProductById() async {
    if (widget.productId != null) {
      try {
        GetProductByIdResponseModel response = await _createProductService
            .getProductById(productId: widget.productId ?? "");

        if (response.isSuccess && response.errors.isEmpty) {
          _createProductProvider
              .changeCarbohydrate(response.data.nutritions[1].value);
          _createProductProvider.changeFat(response.data.nutritions[2].value);
          _createProductProvider.changeFibre(response.data.nutritions[3].value);
          _createProductProvider
              .changeProtein(response.data.nutritions[0].value);
          _createProductProvider
              .changeIsGluetenFree(response.data.ingredients[0].isInclude);
          _createProductProvider
              .changeIsVegetarian(response.data.ingredients[1].isInclude);
          _createProductProvider
              .changeIsVegan(response.data.ingredients[2].isInclude);
          _createProductProvider
              .changeIsLactoseFree(response.data.ingredients[3].isInclude);
          _createProductProvider
              .changeIsHalal(response.data.ingredients[4].isInclude);
          _nameController.text = response.data.name;
          _priceController.text = response.data.price.toString();
          _descriptionController.text = response.data.description;
        }
      } catch (e) {
        throw UnimplementedError(e.toString());
      }
    } else if (widget.productId == null) {}
  }

  Future<void> uploadObject({required Object fileObject}) {
    List<XFile> file = fileObject as List<XFile>;
    _createProductProvider.addAllItemPreviewImage(file);

    return Future.value();
  }
}
