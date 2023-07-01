part of '../view/edit_business_view.dart';

abstract class EditBusinessViewModel extends State<EditBusinessView> {
  late final ImagePicker _imagePicker;
  late final EditBusinessProvider _editBusinessProvider;
  late final TextEditingController _emailController;
  late final TextEditingController _businessNameController;

  late final TextEditingController _countryController;


  @override
  void initState() {
    super.initState();
    _editBusinessProvider = EditBusinessProvider.instance;
    _emailController = TextEditingController();
    _countryController = TextEditingController();
    _businessNameController = TextEditingController();

    _imagePicker = ImagePicker();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
   
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
