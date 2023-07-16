import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';

import '../../../../product/utility/durations.dart';
import '../../../../product/utility/page_padding.dart';
import '../model/onboard_model.dart';

class OnBoardNextButton extends StatelessWidget {
  const OnBoardNextButton({
    Key? key,
    required int currentPage,
    required PageController pageController,
    required this.navigateToLogin,
  })  : _currentPage = currentPage,
        _pageController = pageController,
        super(key: key);

  final int _currentPage;
  final String _nextText = "Next";
  final String _doneText = "Done";
  final String _getStarted = "Get Started";

  final PageController _pageController;
  final void Function(BuildContext context) navigateToLogin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.horizontalMedium(),
      child: Row(
        children: [
          Expanded(
            child: CommonElevationButton(
                onPressed: () =>
                    _pageButtonState(context, _currentPage, _pageController),
                style: ButtonStyle(
                    minimumSize:
                        MaterialStatePropertyAll(Size(context.width / 2, 50))),
                child: Text(
                    OnboardModels.items.length != (_currentPage + 1)
                        ? _nextText
                        : _doneText,
                    style: TextStyle(
                        fontSize: context.text.titleMedium!.fontSize))),
          ),
        ],
      ),
    );
  }

  dynamic _pageButtonState(BuildContext context, currentPage, pageController) {
    return OnboardModels.items.length != (currentPage + 1)
        ? pageController.animateToPage(currentPage + 1,
            duration: const PageDurations.low(), curve: Curves.easeInOutCubic)
        : navigateToLogin(context);
  }
}
