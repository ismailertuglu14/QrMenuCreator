part of '../view/edit_business_view.dart';

abstract class EditBusinessViewModel extends State<EditBusinessView> {
  late final ImagePicker _imagePicker;
  late final EditProfileProvider _editProfileProvider;
  late final TextEditingController _emailController;
  late final TextEditingController _businessNameController;

  late final TextEditingController _countryController;
  late final FlCountryCodePicker _countryPicker;

  @override
  void initState() {
    super.initState();
    _editProfileProvider = EditProfileProvider.instance;
    _emailController = TextEditingController();
    _countryController = TextEditingController();
    _businessNameController = TextEditingController();

    _imagePicker = ImagePicker();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _countryPicker = FlCountryCodePicker(
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
    _countryController.dispose();
    _emailController.dispose();
    _businessNameController.dispose();
  }
}
