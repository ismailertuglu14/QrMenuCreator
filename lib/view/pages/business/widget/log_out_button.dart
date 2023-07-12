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
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: PagePadding.allLow(),
            child: CommonElevationButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) => logOutDialog(context)),
              child: Padding(
                padding: PagePadding.allMedium(),
                child: Text("Log Out",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: context.text.titleMedium?.fontSize)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
