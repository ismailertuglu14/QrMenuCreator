import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/product/widget/text_form_field.dart';

import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/elevation_button.dart';

class ResetPasswordSubmitChangeStep extends StatelessWidget {
  const ResetPasswordSubmitChangeStep(
      {super.key,
      required this.resetPassword,
      required this.passwordConfirmTextController,
      required this.passwordTextController});

  final Future<void> Function() resetPassword;
  final TextEditingController passwordConfirmTextController;
  final TextEditingController passwordTextController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Şifreniz en az 6 karakter uzunluğunda olmalıdır.",
            style: TextStyle(fontSize: context.text.titleMedium?.fontSize)),
        Form(
            child: Column(
          children: [
            CommonTextFormField(textController: passwordTextController),
            CommonTextFormField(textController: passwordConfirmTextController),
          ],
        )),
        Row(
          children: [
            Expanded(
              child: CommonElevationButton(
                child: const Padding(
                  padding: PagePadding.allHeight(),
                  child: Text("Change password"),
                ),
                onPressed: () => resetPassword(),
              ),
            ),
          ],
        )
      ],
    );
  }
}
