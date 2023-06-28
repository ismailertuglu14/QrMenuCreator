import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  static HomeProvider? _instance;

  static HomeProvider get instance {
    _instance ??= HomeProvider._();
    return _instance!;
  }

  HomeProvider._() {
    _pageController = PageController(initialPage: _currentIndex);
  }

  int _currentIndex = 0;
  late final PageController _pageController;

  int get currentIndex => _currentIndex;
  PageController get pageController => _pageController;

  void changeCurrentIndex(int value) {
    _currentIndex = value;
    _pageController.jumpToPage(value);
    notifyListeners();
  }
}
