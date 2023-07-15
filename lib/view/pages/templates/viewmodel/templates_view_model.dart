part of '../view/templates_view.dart';

abstract class TemplatesViewModel extends State<TemplatesView>
    with SingleTickerProviderStateMixin {
  late final TemplatesProvider _templatesProvider;
  late final CategoryService _categoryService;
  late final DashboardService _dashboardService;
  late final ProductService _productService;
  late final AnimationController _animationController;
  late final List<Widget> templates;

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
    templates = [
      CeladonMenuStyle(model: model),
      FulvousMenuStyle(model: model),
    ];
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  final BaseTemplateModel model = BaseTemplateModel(
      List.generate(
          25,
          (index) => GetCategoriesData(
              id: "id",
              name: "Tatlılar",
              image:
                  "https://img.jacca.com/pixlogo/product/778c091d-d512-4772-bf80-5e296f859504.jpg",
              productCount: 12)),
      List.generate(
          25,
          (index) => GetProductsByMenuIdData(
                  id: "id",
                  name: "Taquitos",
                  description:
                      "descriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescription",
                  price: 256,
                  currency: "currency",
                  images: [
                    "https://img.jacca.com/pixlogo/product/46774f5c-fe01-4363-9e1b-76e4ac78caa5.jpg"
                  ])));

  void initTemplate() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _dashboardService.getRestaurantMenus();
      await _productService.getProductsByMenuId(
          requestModel:
              GetProductsByCategoyIdRequestModel(categoryId: "categoryId"));
      await _categoryService.getCategories(
          requestModel: GetCategoriesRequestModel(menuId: "menuId"));
    });
  }
}
