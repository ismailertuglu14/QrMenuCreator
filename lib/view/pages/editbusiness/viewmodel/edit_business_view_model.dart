// ignore_for_file: use_build_context_synchronously

part of '../view/edit_business_view.dart';

abstract class EditBusinessViewModel extends State<EditBusinessView> {
  late final ImagePicker _imagePicker;
  late final EditBusinessProvider _editBusinessProvider;
  late final TextEditingController _emailController;
  late final TextEditingController _businessNameController;
  late final EditBusinessService _editBusinessService;
  late final TextEditingController _phoneNumberController;
  late final LocationPickerService _locationPickerService;

  @override
  void initState() {
    super.initState();

    _editBusinessService = EditBusinessService(NetworkManager.instance.dio);
    _locationPickerService = LocationPickerService(NetworkManager.instance.dio);
    _editBusinessProvider = EditBusinessProvider.instance;
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _businessNameController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => init());
    _imagePicker = ImagePicker();
  }

  Future<void> updateBusiness() async {
    if (_businessNameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty) {
      try {
        UpdateBusinessResponseModel response =
            await _editBusinessService.updateBusiness(
          email: _emailController.text,
          currency: _editBusinessProvider.currentCurrency!,
          countryCode: _editBusinessProvider.selectedCountryCode!.dialCode!,
          phoneNumber: _phoneNumberController.text,
          businessName: _businessNameController.text,
          latitude: _editBusinessProvider.currentLocation!.latitude,
          longitude: _editBusinessProvider.currentLocation!.longitude,
        );
        if (response.isSuccess && response.errors.isEmpty) {
          LocaleStorage.instance.setStringValue(
              LocaleKeys.BUSINESS_NAME, _businessNameController.text);
          LocaleStorage.instance
              .setStringValue(LocaleKeys.EMAIL, _emailController.text);
          LocaleStorage.instance.setStringValue(
              LocaleKeys.PHONE_NUMBER, _phoneNumberController.text);
          LocaleStorage.instance.setStringValue(LocaleKeys.PHONE_COUNTRY_CODE,
              _editBusinessProvider.selectedCountryCode!.dialCode!);
          LocaleStorage.instance.setDoubleValue(LocaleKeys.LOCATION_LATITUDE,
              _editBusinessProvider.currentLocation!.latitude);

          LocaleStorage.instance.setDoubleValue(LocaleKeys.LOCATION_LONGITUDE,
              _editBusinessProvider.currentLocation!.longitude);
          LocaleStorage.instance.setStringValue(LocaleKeys.CURRENCY, "TRY");

          Fluttertoast.showToast(msg: "Business updated successfully");
        } else {
          Fluttertoast.showToast(msg: response.errors.first);
        }
      } catch (e) {
        throw UnimplementedError(e.toString());
      }
    } else {
      Fluttertoast.showToast(msg: "Please fill all fields");
    }
  }

  void init() {
    _editBusinessProvider.changeCurrentCurrency(
        LocaleStorage.instance.getStringValue(LocaleKeys.CURRENCY));
    _emailController.text =
        LocaleStorage.instance.getStringValue(LocaleKeys.EMAIL);
    _phoneNumberController.text =
        LocaleStorage.instance.getStringValue(LocaleKeys.PHONE_NUMBER);
    _businessNameController.text =
        LocaleStorage.instance.getStringValue(LocaleKeys.BUSINESS_NAME);
    LatLng currentLocation = LatLng(
        LocaleStorage.instance.getDoubleValue(LocaleKeys.LOCATION_LATITUDE),
        LocaleStorage.instance.getDoubleValue(LocaleKeys.LOCATION_LONGITUDE));
    _editBusinessProvider.changeCurrentLocation(currentLocation);
    _locationPickerService
        .getLocationName(currentLocation: currentLocation, lang: "en")
        .then((value) => _editBusinessProvider.changeCurrentLocationName(
            "${value.locality}, ${value.city}, ${value.countryName}"));
  }

  Future<void> changeCoverImage({required Object fileObject}) async {
    try {
      ChangeCoverImageResponseModel response = await _editBusinessService
          .changeCoverImage(file: fileObject as XFile);

      if (response.isSuccess && response.errors.isEmpty) {
        _editBusinessProvider.changeCoverImage(response.data);
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
    _phoneNumberController.dispose();
    _emailController.dispose();
    _businessNameController.dispose();
  }
}
