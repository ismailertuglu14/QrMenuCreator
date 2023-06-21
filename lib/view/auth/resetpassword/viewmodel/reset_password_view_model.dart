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

  Future<void> checkEmail() async {
    if (_resetTargetTextController.text.isNotEmpty) {
      try {
        _resetPasswordProvider.changeLoading();

        ResetPasswordCheckEmailResponseModel response =
            await _resetPasswordService.checkEmail(
                requestModel: ResetPasswordCheckRequestModel(
                    mail: _resetTargetTextController.text));
        if (response.isSuccess && response.errors.isEmpty) {
          Fluttertoast.showToast(msg: "Doğrulama kodu gönderildi");
          _pageController.animateToPage(
              ResetPasswordStepperKeys.ENTERCODE.index,
              duration: const PageDurations.low(),
              curve: Curves.easeInOut);
        } else {
          Fluttertoast.showToast(msg: "Lütfen kayıtlı bir mail adresi giriniz");
        }
        _resetPasswordProvider.changeLoading();
      } catch (e) {
        throw Exception(e);
      }
    } else {
      Fluttertoast.showToast(msg: "Lütfen bir mail adresi giriniz");
    }
  }

  Future<void> checkOtpCode() async {
    if (_otpCodeTextController.text.isNotEmpty) {
      try {
        _resetPasswordProvider.changeLoading();

        ResetPasswordCheckOtpCodeResponseModel response =
            await _resetPasswordService.checkOtpCode(
                requestModel: ResetPasswordCheckOtpCodeRequestModel(
                    mail: _resetTargetTextController.text,
                    code: _otpCodeTextController.text));
        if (response.isSuccess && response.errors.isEmpty) {
          Fluttertoast.showToast(msg: "Doğrulama başarılı");

          _pageController.animateToPage(
              ResetPasswordStepperKeys.NEWPASSWORD.index,
              duration: const PageDurations.low(),
              curve: Curves.easeInOut);
        } else {
          Fluttertoast.showToast(msg: "Doğrulama kodu yanlış");
        }
        _resetPasswordProvider.changeLoading();
      } catch (e) {
        throw Exception(e);
      }
    } else {
      Fluttertoast.showToast(msg: "Lütfen geçerli bir kod giriniz");
    }
  }

  Future<void> resetPassword() async {
    if (_passwordTextController.text.isNotEmpty &&
        _passwordConfirmTextController.text.isNotEmpty &&
        _passwordTextController.text == _passwordConfirmTextController.text) {
      try {
        _resetPasswordProvider.changeLoading();

        ResetPasswordResponseModel response =
            await _resetPasswordService.resetPassword(
                requestModel: ResetPasswordRequestModel(
                    code: _otpCodeTextController.text,
                    newPassword: _passwordTextController.text,
                    newPasswordAgain: _passwordConfirmTextController.text,
                    mail: _resetTargetTextController.text));
        _resetPasswordProvider.changeLoading();

        if (response.isSuccess && response.errors.isEmpty) {
          Fluttertoast.showToast(msg: "Şifreniz başarıyla değiştirildi");
          context.go(RouterKeys.LOGIN.route);
        } else {
          Fluttertoast.showToast(msg: "Şifreniz değiştirilemedi");
        }
        _resetPasswordProvider.changeLoading();
      } catch (e) {
        throw Exception(e);
      }
    } else {
      Fluttertoast.showToast(msg: "Şifreler boş veya uyuşmuyor");
    }
  }
}
