part of '../view/edit_business_view.dart';

abstract class EditBusinessViewModel extends State<EditBusinessView> {
  late final ImagePicker _imagePicker;
  late final EditBusinessProvider _editBusinessProvider;
  late final TextEditingController _emailController;
  late final TextEditingController _businessNameController;
  late final EditBusinessService _editBusinessService;
  late final TextEditingController _countryController;

  @override
  void initState() {
    super.initState();
    _editBusinessService = EditBusinessService(NetworkManager.instance.dio);
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

  Future<void> changeCoverImage({required Object fileObject}) async {
    try {
      ChangeCoverImageResponseModel response = await _editBusinessService
          .changeCoverImage(file: fileObject as XFile);

      if (response.isSuccess && response.errors.isEmpty) {
        _editBusinessProvider.changeProfileImage(response.data);
        LocaleStorage.instance
            .setStringValue(LocaleKeys.COVER_IMAGE, response.data);
      }
    } catch (e) {
      throw UnimplementedError(e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
    _countryController.dispose();
    _emailController.dispose();
    _businessNameController.dispose();
  }
}
