part of '../view/templates_view.dart';

abstract class TemplatesViewModel extends State<TemplatesView>
    with SingleTickerProviderStateMixin {
  late final TemplatesProvider _templatesProvider;
  late final CategoryService _categoryService;
  late final DashboardService _dashboardService;
  late final ProductService _productService;
  late final AnimationController _animationController;
  late final List<Widget> _templates;
  late final BaseTemplateModel _model;

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

    _model = BaseTemplateModel(
      _templatesProvider.categories,
      _templatesProvider.products,
    );
    _templates = [
      FulvousMenuStyle(model: _model),
      CeladonMenuStyle(model: _model),
    ];
    getMenus();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  Future<void> changeTemplate() async {
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
      }
      _templatesProvider.changeLoading();
    } catch (e) {
      throw Exception(e);
    }
  }

  void getMenus() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        GetRestaurantMenusResponseModel menuResponse =
            await _dashboardService.getRestaurantMenus();

        if (menuResponse.errors.isEmpty && menuResponse.isSuccess) {
          _templatesProvider.changeMenus(menuResponse.data);
        }
      } catch (e) {
        throw Exception(e);
      }
    });
  }
}
