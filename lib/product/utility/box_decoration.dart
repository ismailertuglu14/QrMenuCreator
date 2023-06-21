import 'package:flutter/material.dart';

import 'border_radius.dart';

class TabbarDecoration extends BoxDecoration {
  TabbarDecoration.auth()
      : super(
          color: Colors.orange,
          backgroundBlendMode: BlendMode.softLight,
          border: Border.all(color: Colors.orange),
          borderRadius: const PageBorderRadius.allMedium(),
          boxShadow: [const BoxShadow(color: Colors.orange)],
        );
}
