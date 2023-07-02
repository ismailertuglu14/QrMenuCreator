import 'package:flutter/material.dart';

class SectionProvider extends ChangeNotifier {
  static SectionProvider? _instance;

  static SectionProvider get instance {
    _instance ??= SectionProvider._();
    return _instance!;
  }

  SectionProvider._() {
    _sectionController = TextEditingController();
  }

  List<String> _sectionList = [
    "Beer",
    "Breakfast",
    "Brunch",
    "Dessert",
    "Dinner",
    "Lunch",
    "Main Courses"
  ];

  int? _selectedSuggestionIndex;

  late final TextEditingController _sectionController;

  List<String> get sectionList => _sectionList;

  int? get selectedSuggestionIndex => _selectedSuggestionIndex;
  TextEditingController get sectionController => _sectionController;

  set selectedSuggestionIndex(int? selectedSuggestionIndex) {
    _selectedSuggestionIndex = selectedSuggestionIndex;
    notifyListeners();
  }

  void addSection(String section) {
    _sectionList.add(section);
    notifyListeners();
  }

  void removeSection(int index) {
    _sectionList.removeAt(index);
    notifyListeners();
  }

  void setSectionList(List<String> sectionList) {
    _sectionList = sectionList;
    notifyListeners();
  }
}
