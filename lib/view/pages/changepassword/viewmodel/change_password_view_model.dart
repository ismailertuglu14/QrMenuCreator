// ignore_for_file: use_build_context_synchronously

part of '../view/change_password_view.dart';

abstract class ChangePasswordViewModel extends State<ChangePasswordView> {
  late final TextEditingController _oldPasswordController;
  late final TextEditingController _newPasswordController;
  late final TextEditingController _confirmPasswordController;
  late final ChangePasswordService _changePasswordService;

  @override
  void initState() {
    super.initState();
    _changePasswordService = ChangePasswordService(NetworkManager.instance.dio);
    _oldPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
  }

  Future<void> changePassword() async {
    if (_oldPasswordController.text.isNotEmpty &&
        _newPasswordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty) {
      if (_newPasswordController.text == _confirmPasswordController.text) {
        ChangePasswordResponseModel response =
            await _changePasswordService.changePassword(
                requestModel: ChangePasswordRequestModel(
                    oldPassword: _oldPasswordController.text,
                    newPassword: _newPasswordController.text));
        if (response.isSuccess) {
          Fluttertoast.showToast(msg: "Password changed");
          context.pop();
        } else {
          Fluttertoast.showToast(msg: "Password not changed");
        }
      } else {
        Fluttertoast.showToast(msg: "Password not match");
      }
    } else {
      Fluttertoast.showToast(msg: "Please fill all fields");
    }
  }
}
