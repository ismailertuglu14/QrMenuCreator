import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/context_extension.dart';

import '../../../../product/utility/durations.dart';
import '../../../../product/utility/page_padding.dart';
import '../model/onboard_model.dart';

class OnBoardNextButton extends StatelessWidget {
  const OnBoardNextButton({
    Key? key,
    required this.currentPage,
    required this.pageController,
    required this.navigateToLogin,
  }) : super(key: key);

  final int currentPage;
  final String nextText = "Next";
  final String doneText = "Done";
  final PageController pageController;
  final void Function(BuildContext context) navigateToLogin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.verticalDefault(),
      child: ElevatedButton(
          onPressed: () =>
              _pageButtonState(context, currentPage, pageController),
          style: ButtonStyle(
              minimumSize:
                  MaterialStatePropertyAll(Size(context.width / 2, 50))),
          child: Text(
              OnboardModels.items.length != (currentPage + 1)
                  ? nextText
                  : doneText,
              style: TextStyle(fontSize: context.text.titleLarge!.fontSize))),
    );
  }

  dynamic _pageButtonState(BuildContext context, currentPage, pageController) {
    return OnboardModels.items.length != (currentPage + 1)
        ? pageController.animateToPage(currentPage + 1,
            duration: const PageDurations.min(), curve: Curves.easeInOutCubic)
        : navigateToLogin(context);
  }
}
