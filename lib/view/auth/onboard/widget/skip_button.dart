import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/view/auth/onboard/model/onboard_model.dart';
import '../../../../product/utility/page_padding.dart';

class OnboardSkipButton extends StatelessWidget {
  const OnboardSkipButton({
    Key? key,
    required this.navigateToLogin,
    required this.index,
  }) : super(key: key);
  final String skipText = "Skip";
  final int index;
  final void Function(BuildContext context) navigateToLogin;
  @override
  Widget build(BuildContext context) {
    return index == OnboardModels.items.length - 1
        ? SizedBox.shrink()
        : Padding(
            padding: const PagePadding.allMedium(),
            child: TextButton(
                onPressed: () {
                  navigateToLogin(context);
                },
                child: Text(skipText,
                    style: TextStyle(
                        color: context.colorScheme.surface,
                        fontSize: context.text.titleLarge!.fontSize))),
          );
  }
}
