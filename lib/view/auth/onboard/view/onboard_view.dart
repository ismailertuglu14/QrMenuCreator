import "package:flutter/material.dart";
import 'package:go_router/go_router.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import '../../../../core/constans/cache/locale_keys_enum.dart';
import '../../../../core/constans/enum/route_keys.dart';
import '../../../../core/init/cache/local_storage.dart';
import '../../../../product/utility/page_padding.dart';
import '../model/onboard_model.dart';
import '../widget/indicator.dart';
import '../widget/next_button.dart';
import '../widget/page_view_items.dart';
import '../widget/skip_button.dart';
part '../viewmodel/onboard_view_model.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends OnboardViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const PagePadding.verticalHight(),
        child: Column(children: [
          Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.centerRight,
                  child: OnboardSkipButton(
                      index: _currentPage, navigateToLogin: navigateToLogin))),
          Expanded(
              flex: 7,
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: OnboardModels.items.length,
                  onPageChanged: (value) => _onChanged(value),
                  itemBuilder: (context, index) =>
                      PageViewItems(index: index))),
          Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      pageIndicator(_currentPage, OnboardModels.items.length))),
          Expanded(
              flex: 1,
              child: OnBoardNextButton(
                  currentPage: _currentPage,
                  pageController: _pageController,
                  navigateToLogin: navigateToLogin))
        ]),
      ),
    );
  }
}
