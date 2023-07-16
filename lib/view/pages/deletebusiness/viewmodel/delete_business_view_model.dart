// ignore_for_file: use_build_context_synchronously

part of '../view/delete_business_view.dart';

abstract class DeleteBusinessViewModel extends State<DeleteBusinessView> {
  late final DeleteBusinessService _deleteBusinessService;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _deleteBusinessService = DeleteBusinessService(NetworkManager.instance.dio);
    _passwordController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => DeleteBusinessProvider.instance.changeConfirm(false));
   
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> deleteBusiness() async {
    try {
      DeleteBusinessResponseModel response =
          await _deleteBusinessService.deleteBusiness(
              requestModel: DeleteBusinessRequestModel(
                  restaurantId: LocaleStorage.instance
                      .getStringValue(LocaleKeys.RESTAURANT_ID),
                  password: _passwordController.text));
      if (response.isSuccess && response.errors.isEmpty) {
        LocaleStorage.instance.clearAll();
        context.go(RouterKeys.LOGIN.route);
        Fluttertoast.showToast(msg: "Business Deleted");


      } else {
        Fluttertoast.showToast(msg: response.errors[0].message);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
