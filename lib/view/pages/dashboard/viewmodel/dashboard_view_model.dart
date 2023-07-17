part of '../view/dashboard_view.dart';

abstract class DashboardViewModel extends State<DashboardView>
    with SingleTickerProviderStateMixin {
  late final HomeProvider _homeProvider;
  late final DashboardService _dashboardService;
  late final DashboardProvider _dashboardProvider;
  late final AnimationController _animationController;
  late final TextEditingController _menuNameController;
  late final ImagePicker _imagePicker;

  @override
  void initState() {
    super.initState();
    _dashboardProvider = DashboardProvider.instance;
    _dashboardService = DashboardService(NetworkManager.instance.dio);

    _menuNameController = TextEditingController();

    _imagePicker = ImagePicker();
    _animationController =
        AnimationController(vsync: this, duration: PageDurations.low());
    _homeProvider = HomeProvider.instance;

    WidgetsBinding.instance.addPostFrameCallback((_) => getRestaurantMenus());
  }

  @override
  void dispose() {
    _menuNameController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> getRestaurantMenus() async {
    try {
      _dashboardProvider.changeLoading();
      GetRestaurantMenusResponseModel response =
          await _dashboardService.getRestaurantMenus();
      if (response.isSuccess && response.errors.isEmpty) {
        _dashboardProvider.setRestaurantMenus = response.data;
      } else {
        Fluttertoast.showToast(msg: "Get Restaurant Menus Failed");
      }
    } catch (e) {
      throw UnimplementedError(e.toString());
    } finally {
      _dashboardProvider.changeLoading();
    }
  }

  Future<void> deleteRestaurantMenu() async {
    try {
      _dashboardProvider.changeLoading();

      DeleteRestaurantMenusResponseModel response =
          await _dashboardService.deleteRestaurantMenu(
              resquestModel: DeleteMenuRequestModel(
                  menuId: _dashboardProvider.selectedMenuId ?? ""));
      if (response.isSuccess && response.errors.isEmpty) {
        _dashboardProvider
            .removeRestaurantMenu(_dashboardProvider.selectedMenuId ?? "");
        Fluttertoast.showToast(msg: "Delete Menu Success");
      } else {
        Fluttertoast.showToast(msg: "Delete Menu Failed");
      }
    } catch (e) {
      throw UnimplementedError(e.toString());
    } finally {
      _dashboardProvider.changeLoading();
    }
  }

  Future<void> createMenu() async {
    if (_menuNameController.text.isNotEmpty &&
        _dashboardProvider.menuImage != null) {
      try {
        _dashboardProvider.changeLoading();
        CreateMenuResponseModel response = await _dashboardService.createMenu(
            name: _menuNameController.text,
            templateId: _dashboardProvider.selectedTemplateKey.index,
            imageFile: _dashboardProvider.menuImage!);
        if (response.isSuccess && response.errors.isEmpty) {
          _dashboardProvider.addRestaurantMenu(RestaurantMenuData(
              coverImage: response.data.coverImage,
              id: response.data.id,
              name: response.data.name,
              templateId: response.data.templateId,
              restaurantId: response.data.restaurantId,
              productCount: 0,
              categoryCount: 0));
          _menuNameController.clear();

          Fluttertoast.showToast(msg: "Create Menu Success");
        } else {
          Fluttertoast.showToast(msg: "Create Menu Failed");
        }
      } catch (e) {
        throw UnimplementedError(e.toString());
      } finally {
        _dashboardProvider.changeLoading();
      }
    } else {
      Fluttertoast.showToast(msg: "Menu Name is Empty");
    }
  }

  Future<void> uploadFile({required Object fileObject}) async {
    try {
      _dashboardProvider.changeLoading();
      fileObject as XFile;

      _dashboardProvider.setMenuImage = fileObject;
    } catch (e) {
      throw Exception(e);
    } finally {
      _dashboardProvider.changeLoading();
    }
  }
}
