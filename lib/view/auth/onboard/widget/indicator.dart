import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/context_extension.dart';

import '../../../../product/utility/durations.dart';

pageIndicator(BuildContext context, int currentPage, int length,
    {required void Function(BuildContext) navigateToLogin}) {
  return List<Widget>.generate(
      length,
      (index) => AnimatedContainer(
          height: 4,
          duration: const PageDurations.min(),
          width: (index == currentPage) ? 30 : 10,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: (index == currentPage)
                  ? Color(0xFF2ecc71)
                  : Color(0xFF2ecc71).withOpacity(0.5))));
}
