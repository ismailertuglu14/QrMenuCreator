import "package:flutter/material.dart";
import 'package:go_router/go_router.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';
import '../../../../core/constans/cache/locale_keys_enum.dart';
import '../../../../core/constans/enum/route_keys.dart';
import '../../../../core/init/cache/local_storage.dart';
import '../../../../product/utility/page_padding.dart';
import '../model/onboard_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const PagePadding.verticalHight(),
        child: Column(children: [
          Expanded(
              flex: 8,
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: OnboardModels.items.length,
                  onPageChanged: (value) => _onChanged(value),
                  itemBuilder: (context, index) =>
                      PageViewItems(index: index))),
          Expanded(
            flex: 1,
            child: AnimatedSmoothIndicator(
                effect: ExpandingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: context.colorScheme.primary),
                activeIndex: _currentPage,
                count: OnboardModels.items.length),
          ),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Expanded(
                    child: OnBoardNextButton(
                        currentPage: _currentPage,
                        pageController: _pageController,
                        navigateToLogin: navigateToLogin),
                  ),
                  Expanded(
                      child:
                          OnboardSkipButton(navigateToLogin: navigateToLogin)),
                ],
              )),
        ]),
      ),
    );
  }
}
