// ignore_for_file: use_build_context_synchronously

part of "../view/login_view.dart";

abstract class LoginViewModels extends State<LoginView> with CacheInit {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final LoginProvider _loginProvider;
  late final LoginService _loginService;

  @override
  void initState() {
    super.initState();
    _loginService = LoginService(NetworkManager.instance.dio);
    _loginProvider = LoginProvider.instance;

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Future<void> login() async {
    if (_loginProvider.formKey.currentState!.validate()) {
      try {
        _loginProvider.changeIsLoading();
        LoginResponseModel response = await _loginService.login(
            requestModel: LoginRequestModel(
                email: _emailController.text,
                password: _passwordController.text));
        if (response.isSuccess && response.errors.isEmpty) {
          context.go(RouterKeys.HOME.route);
          Fluttertoast.showToast(msg: "Login Success");
        } else {
          Fluttertoast.showToast(msg: "Failed to login");
        }
        _loginProvider.changeIsLoading();
      } catch (e) {
        _loginProvider.changeIsLoading();
        Fluttertoast.showToast(msg: "Failed to login");
      }
    } else {
      Fluttertoast.showToast(msg: "Please fill in the blanks");
    }
  }
}
