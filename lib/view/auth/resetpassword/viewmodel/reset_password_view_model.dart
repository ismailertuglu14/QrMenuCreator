// ignore_for_file: use_build_context_synchronously

part of '../view/reset_password_view.dart';

abstract class ResetPasswordViewModel extends State<ResetPasswordView>
    with TickerProviderStateMixin {
  bool _isLoading = false;
  bool isError = false;
  late final TabController _tabController;
  late final ResetPasswordService _resetPasswordService;
  late final PageController _pageController;
  late final TextEditingController _passwordTextController;
  late final TextEditingController _passwordConfirmTextController;

  late final TextEditingController _resetTargetTextController;
  late final TextEditingController _otpCodeTextController;

  @override
  void dispose() {
    super.dispose();
    _otpCodeTextController.dispose();
    _tabController.dispose();
    _pageController.dispose();
    _passwordTextController.dispose();
    _resetTargetTextController.dispose();
    _passwordConfirmTextController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _otpCodeTextController = TextEditingController();
    _resetTargetTextController = TextEditingController();
    _tabController =
        TabController(length: ResetPasswordTypeKeys.values.length, vsync: this);
    _pageController = PageController();

    _resetPasswordService = ResetPasswordService(NetworkManager.instance.dio);
    _passwordTextController = TextEditingController();
    _passwordConfirmTextController = TextEditingController();
  }

  int _currentStep = 0;

  void onStepContinue() {
    if (_currentStep < ResetPasswordStepperKeys.values.length - 1) {
      setState(() => _currentStep += 1);
    }
  }

  void changeCurrentStep(int index) => setState(() => _currentStep = index);

  void onStepCancel() {
    if (_currentStep > 0 && _currentStep < 4) {
      setState(() => _currentStep -= 1);
    }
  }

  void changeLoading() => setState(() => _isLoading = !_isLoading);
}
