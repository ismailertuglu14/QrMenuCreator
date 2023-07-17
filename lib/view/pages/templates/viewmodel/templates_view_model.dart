part of '../view/templates_view.dart';

abstract class TemplatesViewModel extends State<TemplatesView>
    with SingleTickerProviderStateMixin {
  late final TemplatesProvider _templatesProvider;
  late final CategoryService _categoryService;
  late final DashboardService _dashboardService;
  late final ProductService _productService;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _categoryService = CategoryService(NetworkManager.instance.dio);
    _dashboardService = DashboardService(NetworkManager.instance.dio);
    _productService = ProductService(NetworkManager.instance.dio);
    _templatesProvider = TemplatesProvider.instance;
    _animationController = AnimationController(
        vsync: this,
        duration: PageDurations.normal(),
        reverseDuration: PageDurations.normal());

    getMenus();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  Future<void> changeTemplate() async {
    if (_templatesProvider.selectedMenuId == "DEFAULT") {
      final BaseTemplateModel model = BaseTemplateModel(
          List.generate(
              30,
              (index) => GetCategoriesData(
                  id: "id",
                  name: "Juices",
                  image:
                      "https://img.jacca.com/pixlogo/product/778c091d-d512-4772-bf80-5e296f859504.jpg",
                  productCount: 12)),
          List.generate(
              30,
              (index) => GetProductsByMenuIdData(
                      isNew: true,
                      id: "id",
                      name: "Taquitos",
                      description:
                          "descriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescription",
                      price: 256,
                      currency: "currency",
                      images: [
                        "https://img.jacca.com/pixlogo/product/46774f5c-fe01-4363-9e1b-76e4ac78caa5.jpg",
                        "https://img.jacca.com/pixlogo/product/273aad3f-4400-4f02-a0d6-0bebcc38fe71.jpg",
                        "https://img.jacca.com/pixlogo/product/b23915fa-4de0-40b6-b920-54dc6c5d3971.jpg"
                      ])));

      _templatesProvider.setTemplates = [
        FulvousMenuStyle(model: model),
        CeladonMenuStyle(model: model),
      ];
      _templatesProvider.changeCategories(model.categories);
      _templatesProvider.changeProducts(model.products);
    } else {
      try {
        _templatesProvider.changeLoading();
        GetCategoriesResponseModel categoriesResponse =
            await _categoryService.getCategories(
                requestModel: GetCategoriesRequestModel(
                    menuId: _templatesProvider.selectedMenuId ?? ""));
        GetProductsByMenuIdResponseModel productResponse =
            await _productService.getProductsByMenuId(
                requestModel: GetProductsByCategoyIdRequestModel(
                    categoryId: _templatesProvider.selectedMenuId ?? ""));
        if (categoriesResponse.errors.isEmpty &&
            categoriesResponse.isSuccess &&
            productResponse.errors.isEmpty &&
            productResponse.isSuccess) {
          _templatesProvider.changeCategories(categoriesResponse.data);
          _templatesProvider.changeProducts(productResponse.data);
          _templatesProvider.setModel = BaseTemplateModel(
            _templatesProvider.categories,
            _templatesProvider.products,
          );

          _templatesProvider.setTemplates = [
            FulvousMenuStyle(model: _templatesProvider.model!),
            CeladonMenuStyle(model: _templatesProvider.model!),
          ];
        }
        _templatesProvider.changeLoading();
      } catch (e) {
        throw Exception(e);
      }
    }
  }

  void getMenus() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        GetRestaurantMenusResponseModel menuResponse =
            await _dashboardService.getRestaurantMenus();

        if (menuResponse.errors.isEmpty && menuResponse.isSuccess) {
          _templatesProvider.addMenus(menuResponse.data);
        }
      } catch (e) {
        throw Exception(e);
      }
    });
  }
}
