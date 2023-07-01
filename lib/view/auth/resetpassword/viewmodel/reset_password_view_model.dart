// ignore_for_file: use_build_context_synchronously

part of '../view/reset_password_view.dart';

abstract class ResetPasswordViewModel extends State<ResetPasswordView>
    with TickerProviderStateMixin {
  late final PageController _pageController;
  late final TabController _tabController;
  late final ResetPasswordService _resetPasswordService;
  late final TextEditingController _passwordTextController;
  late final TextEditingController _passwordConfirmTextController;
  late final TextEditingController _resetTargetTextController;
  late final TextEditingController _otpCodeTextController;
  late final ResetPasswordProvider _resetPasswordProvider;
  

  @override
  void initState() {
    super.initState();
    _resetPasswordService = ResetPasswordService(NetworkManager.instance.dio);
    _tabController =
        TabController(length: ResetPasswordTypeKeys.values.length, vsync: this);

    _resetPasswordProvider =
        Provider.of<ResetPasswordProvider>(context, listen: false);
    _otpCodeTextController = TextEditingController();
    _resetTargetTextController = TextEditingController();

    _pageController = PageController();

    _passwordTextController = TextEditingController();
    _passwordConfirmTextController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      
    });
  }

  @override
  void dispose() {
    super.dispose();
    _resetPasswordProvider.dispose();
    _tabController.dispose();
    _pageController.dispose();
    _otpCodeTextController.dispose();
    _passwordTextController.dispose();
    _resetTargetTextController.dispose();
    _passwordConfirmTextController.dispose();
  }

  Future<void> checkEmail() async {}

  Future<void> checkOtpCode() async {}

  Future<void> resetPassword() async {}
}
