import 'package:flutter/material.dart';

import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/outline_button.dart';

class OnboardSkipButton extends StatelessWidget {
  const OnboardSkipButton({super.key, required this.navigateToLogin});

  final void Function(BuildContext context) navigateToLogin;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => navigateToLogin(context), child: Text("Skip"));
  }
}
