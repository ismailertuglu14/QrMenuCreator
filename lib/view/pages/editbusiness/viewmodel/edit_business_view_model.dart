part of '../view/edit_business_view.dart';

abstract class EditBusinessViewModel extends State<EditBusinessView> {
  late final ImagePicker _imagePicker;
  late final EditBusinessProvider _editBusinessProvider;
  late final TextEditingController _emailController;
  late final TextEditingController _businessNameController;

  late final TextEditingController _countryController;
  late final FlCountryCodePicker _countryPicker;

  @override
  void initState() {
    super.initState();
    _editBusinessProvider = EditBusinessProvider.instance;
    _emailController = TextEditingController();
    _countryController = TextEditingController();
    _businessNameController = TextEditingController();

    _imagePicker = ImagePicker();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _countryPicker = FlCountryCodePicker(
        localize: true,
        title: Text(""),
        countryTextStyle: TextStyle(
            fontWeight: FontWeight.bold, color: context.colorScheme.surface),
        dialCodeTextStyle: TextStyle(
            fontWeight: FontWeight.bold, color: context.colorScheme.surface),
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
      _businessNameController.text =
          LocaleStorage.instance.getStringValue(LocaleKeys.BUSINESS_NAME);
      _emailController.text =
          LocaleStorage.instance.getStringValue(LocaleKeys.EMAIL);

      _countryController.text =
          LocaleStorage.instance.getStringValue(LocaleKeys.PHONE_NUMBER);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _countryController.dispose();
    _emailController.dispose();
    _businessNameController.dispose();
  }
}
