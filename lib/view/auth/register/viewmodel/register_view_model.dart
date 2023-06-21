// ignore_for_file: use_build_context_synchronously

part of '../view/register_view.dart';

abstract class RegisterViewModel extends State<RegisterView> {
  late final RegisterService _registerService;
  late final RegisterProvider _registerProvider;
  late final LoginService _loginService;
  late final TextEditingController _emailTextController;
  late final TextEditingController _firstNameTextController;
  late final TextEditingController _lastNameTextController;
  late final TextEditingController _passwordTextController;
  late final TextEditingController _passwordConfirmTextController;
  late final TextEditingController _contactNumberTextController;

  @override
  void initState() {
    super.initState();

    _loginService = LoginService(NetworkManager.instance.dio);
    _contactNumberTextController = TextEditingController();
    _passwordConfirmTextController = TextEditingController();
    _firstNameTextController = TextEditingController();
    _lastNameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _registerProvider = Provider.of<RegisterProvider>(context, listen: false);
    _registerService = RegisterService(NetworkManager.instance.dio);
  }

  @override
  void dispose() {
    super.dispose();

    _emailTextController.dispose();
    _passwordConfirmTextController.dispose();
    _contactNumberTextController.dispose();
    _firstNameTextController.dispose();
    _lastNameTextController.dispose();
    _passwordTextController.dispose();
  }

  Future<void> register() async {
    try {
      _registerProvider.changeValidateMode(AutovalidateMode.always);
      if (_registerProvider.registerFormKeys
              .map((e) => e.currentState!.validate())
              .every((element) => element) &&
          _registerProvider.selectedGender != null) {
        _registerProvider.changeLoading();

        RegisterResponseModel response = await _registerService.register(
            context,
            requestModel: RegisterRequestModel(
                firstName: _firstNameTextController.text,
                lastName: _lastNameTextController.text,
                email: _emailTextController.text,
                password: _passwordTextController.text,
                confirmPassword: _passwordConfirmTextController.text,
                contactNumber: _contactNumberTextController.text));
        if (response.isSuccess && response.errors.isEmpty) {
          context.push(RouterKeys.HOME.route);
        }
        _registerProvider.changeLoading();
      } else {
        List<int> findFalseIndexes() {
          List<int> falseIndexes = [];
          for (int i = 0; i < _registerProvider.isError.length; i++) {
            if (!_registerProvider.isError[i]) {
              falseIndexes.add(i);
            }
          }
          return falseIndexes;
        }

        Fluttertoast.showToast(msg: "Please fill in the required fields");

        _registerProvider.setError(true, findFalseIndexes());
        _registerProvider.changeCurrentStep(_registerProvider.registerFormKeys
            .indexWhere((element) => !element.currentState!.validate()));
      }
    } catch (e) {
      throw UnimplementedError(e.toString());
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
