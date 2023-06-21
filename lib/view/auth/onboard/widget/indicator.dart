import 'package:flutter/material.dart';

import '../../../../product/utility/durations.dart';

List<Widget> pageIndicator(int currentPage, int length) {
  return List<Widget>.generate(
      length,
      (index) => AnimatedContainer(
          height: 10,
          duration: const PageDurations.min(),
          width: (index == currentPage) ? 30 : 10,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: (index == currentPage)
                  ? Color(0xFF2ecc71)
                  : Color(0xFF2ecc71).withOpacity(0.5))));
}
