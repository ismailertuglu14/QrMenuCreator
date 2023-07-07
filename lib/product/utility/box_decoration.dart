import 'package:flutter/material.dart';

import 'border_radius.dart';

class TabbarDecoration extends BoxDecoration {
  TabbarDecoration.auth()
      : super(
          color: Color(0xFF3AB86F),
          backgroundBlendMode: BlendMode.softLight,
          border: Border.all(color: Color(0xFF3AB86F)),
          borderRadius: const PageBorderRadius.allMedium(),
          boxShadow: [const BoxShadow(color: Color(0xFF3AB86F))],
        );
}
