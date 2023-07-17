// ignore_for_file: use_build_context_synchronously

part of '../view/edit_business_view.dart';

abstract class EditBusinessViewModel extends State<EditBusinessView> {
  late final ImagePicker _imagePicker;
  late final EditBusinessProvider _editBusinessProvider;
  late final TextEditingController _emailController;
  late final TextEditingController _businessNameController;
  late final EditBusinessService _editBusinessService;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _socialMediaLinkController;

  @override
  void initState() {
    super.initState();
    
    _editBusinessService = EditBusinessService(NetworkManager.instance.dio);
    _editBusinessProvider = EditBusinessProvider.instance;
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _businessNameController = TextEditingController();
    _socialMediaLinkController = TextEditingController();

    _imagePicker = ImagePicker();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _businessNameController.text =
          LocaleStorage.instance.getStringValue(LocaleKeys.BUSINESS_NAME);
      _emailController.text =
          LocaleStorage.instance.getStringValue(LocaleKeys.EMAIL);

      _phoneNumberController.text =
          LocaleStorage.instance.getStringValue(LocaleKeys.PHONE_NUMBER);
      _editBusinessProvider.changeCoverImage(
          LocaleStorage.instance.getStringValue(LocaleKeys.COVER_IMAGE));
      _editBusinessProvider.changeSocialMediaLinks([
        AddSocialMediaLinkModel(
            link: LocaleStorage.instance.getStringValue(LocaleKeys.INSTAGRAM),
            imageKey: ImageKeys.instagram,
            type: AddMediaLinkKeys.INSTAGRAM),
        AddSocialMediaLinkModel(
            link: LocaleStorage.instance.getStringValue(LocaleKeys.TWITTER),
            imageKey: ImageKeys.twitter,
            type: AddMediaLinkKeys.TWITTER),
        AddSocialMediaLinkModel(
            link: LocaleStorage.instance.getStringValue(LocaleKeys.WHATSAPP),
            imageKey: ImageKeys.whatsapp,
            type: AddMediaLinkKeys.WHATSAPP),
        AddSocialMediaLinkModel(
            link: LocaleStorage.instance.getStringValue(LocaleKeys.FACEBOOK),
            imageKey: ImageKeys.facebook,
            type: AddMediaLinkKeys.FACEBOOK),
        AddSocialMediaLinkModel(
            link: LocaleStorage.instance.getStringValue(LocaleKeys.WEBSITE),
            imageKey: ImageKeys.website,
            type: AddMediaLinkKeys.WEBSITE),
      ]);
    });
  }

  Future<void> addSocialMedia() async {
    if (_socialMediaLinkController.text.isNotEmpty) {
      try {
        if (_editBusinessProvider.isLinkEditing) {
          _editBusinessProvider.updateSocialMediaLinks(AddSocialMediaLinkModel(
              link: _editBusinessProvider.editingItem?.link,
              imageKey: _editBusinessProvider.editingItem!.imageKey,
              type: _editBusinessProvider.editingItem!.type));
        } else {
          _editBusinessProvider.addSocialMediaLinks(AddSocialMediaLinkModel(
              link: _socialMediaLinkController.text,
              imageKey:
                  selectImageKey(_editBusinessProvider.selectedAddMediaType),
              type: _editBusinessProvider.selectedAddMediaType));
        }

        ChangeSocialMediaResponseModel response = await _editBusinessService.addSocialMedia(
            requestModel: ChangeSocialMediaRequestModel(
                whatsapp: _editBusinessProvider.selectedAddMediaType == AddMediaLinkKeys.WHATSAPP
                    ? _socialMediaLinkController.text
                    : LocaleStorage.instance
                        .getStringValue(LocaleKeys.WHATSAPP),
                instagram: _editBusinessProvider.selectedAddMediaType == AddMediaLinkKeys.INSTAGRAM
                    ? _socialMediaLinkController.text
                    : LocaleStorage.instance
                        .getStringValue(LocaleKeys.INSTAGRAM),
                twitter: _editBusinessProvider.selectedAddMediaType == AddMediaLinkKeys.TWITTER
                    ? _socialMediaLinkController.text
                    : LocaleStorage.instance.getStringValue(LocaleKeys.TWITTER),
                threads: _editBusinessProvider.selectedAddMediaType == AddMediaLinkKeys.THREADS
                    ? _socialMediaLinkController.text
                    : LocaleStorage.instance.getStringValue(LocaleKeys.THREADS),
                facebook: _editBusinessProvider.selectedAddMediaType == AddMediaLinkKeys.FACEBOOK
                    ? _socialMediaLinkController.text
                    : LocaleStorage.instance
                        .getStringValue(LocaleKeys.FACEBOOK),
                website: _editBusinessProvider.selectedAddMediaType == AddMediaLinkKeys.WEBSITE
                    ? _socialMediaLinkController.text
                    : LocaleStorage.instance.getStringValue(LocaleKeys.WEBSITE)));
        if (response.isSuccess && response.errors.isEmpty) {
          context.focusScope.unfocus();
          _editBusinessProvider.changeIsLinkEditing(false);
          _socialMediaLinkController.clear();
        } else {
          Fluttertoast.showToast(msg: response.errors.first);
        }
      } catch (e) {
        throw UnimplementedError(e.toString());
      }
      _editBusinessProvider
          .changeSelectedAddMediaType(AddMediaLinkKeys.WEBSITE);
    } else {
      Fluttertoast.showToast(msg: "Link can't be empty");
    }
  }

  Future<void> updateBusiness() async {
    if (_businessNameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty) {
      try {
        UpdateBusinessResponseModel response =
            await _editBusinessService.updateBusiness(
          email: _emailController.text,
          currency: "TRY",
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
          LocaleStorage.instance.setStringValue(LocaleKeys.LOCATION_LATITUDE,
              _editBusinessProvider.currentLocation!.latitude.toString());

          LocaleStorage.instance.setStringValue(LocaleKeys.LOCATION_LONGITUDE,
              _editBusinessProvider.currentLocation!.longitude.toString());
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
    _socialMediaLinkController.dispose();

    _businessNameController.dispose();
  }

  ImageKeys selectImageKey(AddMediaLinkKeys value) {
    switch (value) {
      case AddMediaLinkKeys.INSTAGRAM:
        return ImageKeys.instagram;
      case AddMediaLinkKeys.TWITTER:
        return ImageKeys.twitter;
      case AddMediaLinkKeys.THREADS:
        return ImageKeys.threads;
      case AddMediaLinkKeys.FACEBOOK:
        return ImageKeys.facebook;
      case AddMediaLinkKeys.WEBSITE:
        return ImageKeys.website;
      case AddMediaLinkKeys.WHATSAPP:
        return ImageKeys.whatsapp;
    }
  }
}
