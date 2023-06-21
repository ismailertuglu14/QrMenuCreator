part of "../view/login_view.dart";

abstract class LoginViewModels extends State<LoginView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final LoginProvider _loginProvider;

  @override
  void initState() {
    super.initState();
     _loginProvider = Provider.of<LoginProvider>(context, listen: false);
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _loginProvider.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
