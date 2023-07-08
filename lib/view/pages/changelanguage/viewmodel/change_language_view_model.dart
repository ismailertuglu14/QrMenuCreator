part of '../view/change_language_view.dart';

abstract class ChangeLanguageViewModel extends State<ChangeLanguageView> {

  late final ChangeLanguageProvider _changeLanguageProvider;

  @override
  void initState() { 
    super.initState();
    _changeLanguageProvider = ChangeLanguageProvider.instance;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { 
      _changeLanguageProvider.setAllCountryCodes = List.from(countryCodes)
      .map((e) => CountryCode(
          name: e['name'],
          dialCode: e['dial_code'],
          flagUri: 'assets/images/flags/${e['code']!.toLowerCase()}.png'))
      .toList() ;
    });
  }
}
