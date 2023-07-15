import 'package:flutter/material.dart';

import '../../constans/enum/template_keys.dart';

class TemplatesProvider extends ChangeNotifier {
  static TemplatesProvider? _instance;

  static TemplatesProvider get instance {
    _instance ??= TemplatesProvider._();
    return _instance!;
  }

  TemplatesProvider._();
  TemplateKeys _selectedTemplateKey = TemplateKeys.CELADON;

  TemplateKeys get selectedTemplateKey => _selectedTemplateKey;
  bool _isBottomSheetOpen = false;
 


  bool get isBottomSheetOpen => _isBottomSheetOpen;

  void changeTemplateKey(TemplateKeys templateKey) {
    _selectedTemplateKey = templateKey;
    notifyListeners();
  }

 

  void toggleBottomSheet() {
    _isBottomSheetOpen = !_isBottomSheetOpen;
    notifyListeners();
  }
}
