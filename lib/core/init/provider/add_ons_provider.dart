import 'package:flutter/material.dart';

import '../../../view/pages/addons/model/ons_preview_model.dart';

class AddOnsProvider extends ChangeNotifier {
  static AddOnsProvider? _instance;

  static AddOnsProvider get instance {
    _instance ??= AddOnsProvider._init();
    return _instance!;
  }

  AddOnsProvider._init();
  List<OnsPreviewModel> _onsPreviewList = [];

  List<OnsPreviewModel> get onsPreviewList => _onsPreviewList;

  void changeIsSelected(int index, bool value) {
    _onsPreviewList[index].isSelected = value;
    notifyListeners();
  }

  set setOnsPreviewList(List<OnsPreviewModel> value) {
    _onsPreviewList = value;
    notifyListeners();
  }

  void addOnsPreviewList(OnsPreviewModel onsPreviewModel) {
    _onsPreviewList.add(onsPreviewModel);
    notifyListeners();
  }

  void removeOnsPreviewList(OnsPreviewModel onsPreviewModel) {
    _onsPreviewList.remove(onsPreviewModel);
    notifyListeners();
  }

  void removeAllOnsPreviewList() {
    _onsPreviewList.clear();
    notifyListeners();
  }
}
