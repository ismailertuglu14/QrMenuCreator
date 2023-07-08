import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/context_extension.dart';

import '../../../../core/init/provider/login_provider.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/utility/zoom_tap_animation.dart';
import '../../../../product/widget/elevation_button.dart';
import 'log_out_dialog.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
    required LoginProvider loginProvider,
  }) : _loginProvider = loginProvider;

  final LoginProvider _loginProvider;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: PagePadding.allLow(),
            child: ZoomTapAnimation(
              child: CommonElevationButton(
                onPressed: () => logOutDialog(context, _loginProvider),
                child: Padding(
                  padding: PagePadding.allMedium(),
                  child: Text("Log Out",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: context.text.titleMedium?.fontSize)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
