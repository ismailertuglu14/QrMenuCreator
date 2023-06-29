import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/enum/lottie_keys.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';

import '../../../../core/init/provider/login_provider.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/elevation_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.login,
  });
  final Future<void> Function() login;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        children: [
          Expanded(child: Consumer<LoginProvider>(
            builder: (context, provider, child) {
              return provider.isLoading
                  ? LottieKeys.loading.path()
                  : CommonElevationButton(
                      onPressed: () => login(),
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
