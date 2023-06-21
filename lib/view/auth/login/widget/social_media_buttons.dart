import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/view/auth/login/widget/social_media_button_builder.dart';

import '../../../../core/constans/enum/route_keys.dart';
import '../service/social/Social_adapter.dart';

class LoginWithSocialMedia extends StatelessWidget {
  const LoginWithSocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: const [
            Expanded(child: Divider(thickness: 2)),
            Expanded(
                child:
                    Text("Or with social media", textAlign: TextAlign.center)),
            Expanded(child: Divider(thickness: 2)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SocialMediaButtonBuilder(
              adapter: GoogleAdapter(),
              onCompleted: (token) {},
            ),
            SocialMediaButtonBuilder(
              adapter: AppleAdapter(),
              onCompleted: (token) {},
            ),
            SocialMediaButtonBuilder(
              adapter: FacebookAdapter(),
              onCompleted: (token) {},
            )
          ],
        ),
        TextButton(
            onPressed: () => context.go(RouterKeys.REGISTER.route),
            child: Text.rich(
              TextSpan(
                text: "Don't have an account ? ",
                children: [
                  TextSpan(
                      text: "Sign up now!",
                      style: TextStyle(color: context.colorScheme.secondary)),
                ],
              ),
            )),
      ],
    );
  }
}
