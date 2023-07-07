part of '../view/dashboard_view.dart';

abstract class DashboardViewModel extends State<DashboardView> {
  late final HomeProvider _homeProvider;
  late final DashboardService _dashboardService;
  late final DashboardProvider _dashboardProvider;
  late final TextEditingController _menuNameController;

  @override
  void initState() {
    super.initState();
    _dashboardProvider = DashboardProvider.instance;
    _dashboardService = DashboardService(NetworkManager.instance.dio);
    _homeProvider = HomeProvider.instance;
    _menuNameController = TextEditingController();
    getRestaurantMenus();
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
    if (_menuNameController.text.isNotEmpty) {
      try {
        _dashboardProvider.changeLoading();
        CreateMenuResponseModel response = await _dashboardService.createMenu(
            resquestModel: CreateMenuResquestModel(
                name: _menuNameController.text, templateId: 0));
        if (response.isSuccess && response.errors.isEmpty) {
          _dashboardProvider.addRestaurantMenu(response.data);
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
}
