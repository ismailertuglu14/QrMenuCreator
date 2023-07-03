import 'package:flutter/material.dart';

class SectionItemsProvider extends ChangeNotifier {
  static SectionItemsProvider? _instance;

  static SectionItemsProvider get instance {
    _instance ??= SectionItemsProvider._();
    return _instance!;
  }

  SectionItemsProvider._();

  List _sectionItemList = [];

  List get sectionList => _sectionItemList;

  set sectionList(List value) {
    _sectionItemList = value;
    notifyListeners();
  }

  void addSectionItem(Map<String, dynamic> sectionItem) {
    _sectionItemList.add(sectionItem);
    notifyListeners();
  }

  void removeSectionItem(int index) {
    _sectionItemList.removeAt(index);
    notifyListeners();
  }
}
