import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/view/auth/register/widget/privacy_policy_button.dart';

import '../../../../core/constans/enum/lottie_keys.dart';

import '../../../../core/init/provider/register_provider.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/elevation_button.dart';

class RegisterConfirmationStep extends StatelessWidget {
  const RegisterConfirmationStep(
      {super.key, required this.registerProvider, required this.register});
  final RegisterProvider registerProvider;
  final String submit = "Sign up";
  final Future<void> Function() register;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Padding(
        padding: const PagePadding.allDefault(),
        child: privacyPolicyButton(context),
      ),
      Row(children: [
        Expanded(
            child: Padding(
          padding: const PagePadding.allDefault(),
          child: OutlinedButton(
              onPressed: () => registerProvider.onStepCancel(),
              child: const Padding(
                padding: PagePadding.allMedium(),
                child: Text("Cancel"),
              )),
        )),
        Expanded(
            child: registerProvider.isLoading
                ? Lottie.asset(LottieKeys.LOADING.path, height: 50)
                : Padding(
                    padding: const PagePadding.allDefault(),
                    child: CommonElevationButton(
                        onPressed: () => register(),
                        child: Padding(
                          padding: const PagePadding.allMedium(),
                          child: Text(submit),
                        )),
                  )),
      ])
    ]);
  }
}