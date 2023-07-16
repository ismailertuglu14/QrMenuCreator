// ignore_for_file: use_build_context_synchronously

part of '../view/register_view.dart';

abstract class RegisterViewModel extends State<RegisterView> {
  late final RegisterService _registerService;
  late final RegisterProvider _registerProvider;
  late final TextEditingController _emailTextController;
  late final TextEditingController _businessTextController;
  late final TextEditingController _passwordTextController;
  late final TextEditingController _passwordConfirmTextController;
  late final TextEditingController _contactNumberTextController;
  late final LoginService _loginService;

  @override
  void initState() {
    super.initState();
    _registerProvider = RegisterProvider.instance;

    _registerService = RegisterService(NetworkManager.instance.dio);
    _loginService = LoginService(NetworkManager.instance.dio);
    _contactNumberTextController = TextEditingController();
    _businessTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _passwordConfirmTextController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailTextController.dispose();
    _businessTextController.dispose();
    _passwordTextController.dispose();
    _passwordConfirmTextController.dispose();
    _contactNumberTextController.dispose();
  }

  Future<void> register() async {
    if (_emailTextController.text.isNotEmpty &&
        _businessTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty &&
        _passwordConfirmTextController.text.isNotEmpty &&
        _contactNumberTextController.text.isNotEmpty &&
        _registerProvider.selectedCountryCode?.dialCode != null) {
      try {
        _registerProvider.changeLoading();

        RegisterResponseModel response = await _registerService.register(
            context,
            requestModel: RegisterRequestModel(
                restaurantName: _businessTextController.text,
                email: _emailTextController.text,
                password: _passwordTextController.text,
                passwordAgain: _passwordConfirmTextController.text,
                phone: Phone(
                    countryCode:
                        _registerProvider.selectedCountryCode!.dialCode!,
                    phoneNumber: _contactNumberTextController.text)));

        if (response.isSuccess && response.errors.isEmpty) {
          Fluttertoast.showToast(msg: "Register Success");
          _loginService.getBusiness();
          context.go(RouterKeys.HOME.route);
        } else {
          Fluttertoast.showToast(msg: response.errors.first.message);
        }

        _registerProvider.changeLoading();
      } catch (e) {
        Fluttertoast.showToast(msg: "Failed to register");
        _registerProvider.changeLoading();
      }
    } else {
      Fluttertoast.showToast(msg: "Please fill in the blanks");
    }
  }

  Widget _controlsBuilder(BuildContext context, ControlsDetails details) {
    return Padding(
      padding: const PagePadding.verticalMedium(),
      child: Row(
        children: [
          _registerProvider.currentStep > 0 &&
                  _registerProvider.currentStep <
                      RegisterStepKeys.values.last.index
              ? Expanded(
                  child: Padding(
                    padding: const PagePadding.allMin(),
                    child: OutlinedButton(
                        onPressed: () => _registerProvider.onStepCancel(),
                        child: const Padding(
                          padding: PagePadding.allMedium(),
                          child: Text("Cancel"),
                        )),
                  ),
                )
              : const SizedBox.shrink(),
          _registerProvider.currentStep != RegisterStepKeys.values.last.index
              ? Expanded(
                  child: Padding(
                    padding: const PagePadding.allMin(),
                    child: CommonElevationButton(
                        onPressed: () => _registerProvider.onStepContinue(),
                        child: const Padding(
                          padding: PagePadding.allMedium(),
                          child: Text("Continue"),
                        )),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
