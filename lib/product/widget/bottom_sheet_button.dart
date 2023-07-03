import 'package:flutter/material.dart';

import '../utility/page_padding.dart';
import 'elevation_button.dart';

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton({
    super.key,
    this.child,
    this.onPressed,
  });
  final Widget? child;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.allDefault(),
      child: CommonElevationButton(
        onPressed: onPressed,
        child: Padding(
          padding: PagePadding.allHeight(),
          child: child,
        ),
      ),
    );
  }
}
