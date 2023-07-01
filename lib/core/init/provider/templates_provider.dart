import 'package:flutter/material.dart';

class TemplatesProvider extends ChangeNotifier {
  static TemplatesProvider? _instance;

  static TemplatesProvider get instance {
    _instance ??= TemplatesProvider._();
    return _instance!;
  }

  TemplatesProvider._();

  bool _isBottomSheetOpen = false;
  int _selectedTemplate = 0;
  int get selectedTemplate => _selectedTemplate;

  bool get isBottomSheetOpen => _isBottomSheetOpen;

  void changeTemplate(int index) {
    _selectedTemplate = index;
    notifyListeners();
  }

  void toggleBottomSheet() {
    _isBottomSheetOpen = !_isBottomSheetOpen;
    notifyListeners();
  }
}
