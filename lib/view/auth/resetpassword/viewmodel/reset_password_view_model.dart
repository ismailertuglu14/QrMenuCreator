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
  late final FlCountryCodePicker _countryPicker;

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
      _countryPicker = _countryPicker = FlCountryCodePicker(
        localize: true,
        title: Text(""),
        countryTextStyle: TextStyle(fontWeight: FontWeight.bold),
        dialCodeTextStyle: TextStyle(fontWeight: FontWeight.bold),
        searchBarDecoration: InputDecoration(
            errorBorder: OutlineInputBorder(
                borderRadius: const PageBorderRadius.allMedium(),
                borderSide: BorderSide(color: context.colorScheme.error)),
            filled: true,
            label: Text("Search Country"),
            prefixIcon: const Icon(Icons.search_rounded),
            hintStyle:
                TextStyle(color: context.colorScheme.surface.withOpacity(0.5)),
            fillColor: context.colorScheme.onSecondary,
            focusedBorder: OutlineInputBorder(
                borderRadius: const PageBorderRadius.allMedium(),
                borderSide: BorderSide(color: context.colorScheme.secondary)),
            enabledBorder: OutlineInputBorder(
                borderRadius: const PageBorderRadius.allMedium(),
                borderSide: BorderSide(color: context.colorScheme.secondary))),
        showDialCode: true,
        showSearchBar: true,
        showFavoritesIcon: false,
      );
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
