import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:qrmenu/core/constans/cache/locale_keys_enum.dart';
import 'package:qrmenu/core/init/cache/local_storage.dart';
import 'package:qrmenu/view/auth/login/model/get_business_response_model.dart';

import '../../../product/widget/countrycodepicker/country_code.dart';
import '../../../view/pages/editbusiness/model/add_social_media_link_model.dart';
import '../../../view/pages/editbusiness/model/change_social_media_request_model.dart';
import '../../constans/enum/add_media_link_keys.dart';
import '../../constans/enum/gender_keys.dart';

class EditBusinessProvider extends ChangeNotifier {
  static EditBusinessProvider? _instance;

  static EditBusinessProvider get instance {
    _instance ??= EditBusinessProvider._init();
    return _instance!;
  }

  EditBusinessProvider._init();

  String? _coverImage;
  AddMediaLinkKeys _selectedAddMediaType = AddMediaLinkKeys.WEBSITE;

  bool _isLoading = false;
  String? _currentLocationName;

  LatLng? _currentLocation;
  bool _isLinkEditing = false;

  AddSocialMediaLinkModel? _editingItem;
  ChangeSocialMediaRequestModel? _selectedSocialMedia;
  String? get currentLocationName => _currentLocationName;

  AddSocialMediaLinkModel? get editingItem => _editingItem;
  ChangeSocialMediaRequestModel? get selectedSocialMedia =>
      _selectedSocialMedia;

  LatLng? get currentLocation => _currentLocation;
  bool get isLinkEditing => _isLinkEditing;

  List<AddSocialMediaLinkModel> _addedSocialMediaLinks = [];

  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  CountryCode? _selectedCountryCode;

  List<AddSocialMediaLinkModel> get addedSocialMediaLinks =>
      _addedSocialMediaLinks;

  CountryCode? get selectedCountryCode => _selectedCountryCode;
  bool get isLoading => _isLoading;

  String? get coverImage => _coverImage;

  AddMediaLinkKeys get selectedAddMediaType => _selectedAddMediaType;

  AutovalidateMode get autoValidateMode => _autoValidateMode;

  void changeEditItem(AddSocialMediaLinkModel value) {
    _editingItem = value;
    notifyListeners();
  }

  void addSocialMediaLinks(AddSocialMediaLinkModel value) {
    if (_addedSocialMediaLinks.any((item) => item.type == value.type) &&
        value.link != null) {
      _addedSocialMediaLinks
          .firstWhere((item) => item.type == value.type)
          .link = value.link;
    } else {
      _addedSocialMediaLinks.add(value);
    }
    notifyListeners();
  }

  void changeIsLinkEditing(bool value) {
    _isLinkEditing = value;
    notifyListeners();
  }

  void removeSocialMediaLinks(AddSocialMediaLinkModel value) {
    _addedSocialMediaLinks.removeWhere((item) => item.type == value.type);
    notifyListeners();
  }

  void updateSocialMediaLinks(AddSocialMediaLinkModel value) {
    _selectedAddMediaType = value.type;
    _addedSocialMediaLinks.firstWhere((item) => item.type == value.type).link =
        value.link;
    switch (value.type) {
      case AddMediaLinkKeys.INSTAGRAM:
        LocaleStorage.instance
            .setStringValue(LocaleKeys.INSTAGRAM, value.link!);
        break;

      case AddMediaLinkKeys.TWITTER:
        LocaleStorage.instance.setStringValue(LocaleKeys.TWITTER, value.link!);
        break;
      case AddMediaLinkKeys.THREADS:
        LocaleStorage.instance.setStringValue(LocaleKeys.THREADS, value.link!);
        break;
      case AddMediaLinkKeys.FACEBOOK:
        LocaleStorage.instance.setStringValue(LocaleKeys.FACEBOOK, value.link!);
        break;
      case AddMediaLinkKeys.WEBSITE:
        LocaleStorage.instance.setStringValue(LocaleKeys.WEBSITE, value.link!);
        break;
      case AddMediaLinkKeys.WHATSAPP:
        LocaleStorage.instance.setStringValue(LocaleKeys.WHATSAPP, value.link!);
        break;
    }
    notifyListeners();
  }

  void changeSocialMediaLinks(List<AddSocialMediaLinkModel> value) {
    _addedSocialMediaLinks = value;
    notifyListeners();
  }

  void changeSelectedSocialMedia(ChangeSocialMediaRequestModel value) {
    _selectedSocialMedia = value;
    notifyListeners();
  }

  void changeSelectedAddMediaType(AddMediaLinkKeys value) {
    _selectedAddMediaType = value;
    notifyListeners();
  }

  void changeCurrentLocationName(String value) {
    _currentLocationName = value;
    notifyListeners();
  }

  void changeCurrentLocation(LatLng value) {
    _currentLocation = value;
    notifyListeners();
  }

  void changeSelectedCountryCode(CountryCode value) {
    _selectedCountryCode = value;
    notifyListeners();
  }

  void changeCoverImage(String value) {
    _coverImage = value;
    notifyListeners();
  }

  void changeAutoValidateMode(AutovalidateMode value) {
    _autoValidateMode = value;
    notifyListeners();
  }

  void changeLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }
}
