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

  @override
  void initState() {
    super.initState();
    _registerProvider = RegisterProvider.instance;
    _registerService = RegisterService(NetworkManager.instance.dio);
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
        _contactNumberTextController.text.isNotEmpty) {
      try {
        _registerProvider.changeLoading();

        RegisterResponseModel response = await _registerService.register(
            context,
            requestModel: RegisterRequestModel(
                restaurantName: _businessTextController.text,
                email: _emailTextController.text,
                password: _passwordTextController.text,
                passwordAgain: _passwordConfirmTextController.text,
                phone: RegisterPhone(
                    countryCode:
                        _registerProvider.selectedCountryCode!.dialCode!,
                    phoneNumber: _contactNumberTextController.text)));
        if (response.isSuccess && response.errors.isEmpty) {
          Fluttertoast.showToast(msg: "Register Success");
          LocaleStorage.instance
              .setStringValue(LocaleKeys.EMAIL, _emailTextController.text);
          LocaleStorage.instance.setStringValue(
              LocaleKeys.PASSWORD, _passwordTextController.text);
          LocaleStorage.instance.setStringValue(LocaleKeys.PHONE_COUNTRY_CODE,
              _registerProvider.selectedCountryCode!.dialCode!);
          LocaleStorage.instance.setStringValue(
              LocaleKeys.PHONE_NUMBER, _contactNumberTextController.text);
          LocaleStorage.instance.setStringValue(
              LocaleKeys.RESTAURANT_ID, response.data.restaurantResponse.id);

          LocaleStorage.instance.setStringValue(
              LocaleKeys.BUSINESS_NAME, response.data.restaurantResponse.name);
          LocaleStorage.instance.setStringValue(LocaleKeys.ADDRESS,
              response.data.restaurantResponse.address ?? "");
          LocaleStorage.instance.setStringValue(LocaleKeys.COVER_IMAGE,
              response.data.restaurantResponse.profileImage ?? "");
          LocaleStorage.instance.setStringValue(LocaleKeys.BANNER_IMAGE,
              response.data.restaurantResponse.bannerImage ?? "");

          context.go(RouterKeys.HOME.route);
        } else {
          Fluttertoast.showToast(msg: "Failed to register");
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
