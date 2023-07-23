part of '../view/change_language_view.dart';

abstract class ChangeLanguageViewModel extends State<ChangeLanguageView> {
  late final ChangeLanguageProvider _changeLanguageProvider;

  @override
  void initState() {
    super.initState();
    _changeLanguageProvider = ChangeLanguageProvider.instance;
    _changeLanguageProvider.changeCountry(
        LocaleStorage.instance.getStringValue(LocaleKeys.LANGUAGE));
  }
}
