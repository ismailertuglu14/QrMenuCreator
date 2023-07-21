import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/context_extension.dart';

class CloseKeyboard extends StatelessWidget {
  final Widget child;
  const CloseKeyboard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.focusScope.unfocus(),
      child: child,
    );
  }
}
