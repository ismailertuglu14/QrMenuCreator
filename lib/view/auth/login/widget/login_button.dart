import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/context_extension.dart';

import '../../../../core/init/provider/login_provider.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/elevation_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        children: [
          Expanded(child: Consumer<LoginProvider>(
            builder: (context, value, child) {
              return CommonElevationButton(
                onPressed: () =>
                    value.changeAutovalidateMode(AutovalidateMode.always),
                child: Padding(
                  padding: const PagePadding.allMedium(),
                  child: Text("Login",
                      style: TextStyle(
                        color: context.colorScheme.onBackground,
                        fontSize: context.text.titleMedium?.fontSize,
                      )),
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
