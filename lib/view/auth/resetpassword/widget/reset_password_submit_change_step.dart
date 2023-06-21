import 'package:flutter/material.dart';

import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/elevation_button.dart';


class ResetPasswordSubmitChangeStep extends StatefulWidget {
  const ResetPasswordSubmitChangeStep(
      {super.key,
      required this.resetPassword,
      required this.passwordConfirmTextController,
      required this.passwordTextController});

  final Future<void> Function() resetPassword;
  final TextEditingController passwordConfirmTextController;
  final TextEditingController passwordTextController;

  @override
  State<ResetPasswordSubmitChangeStep> createState() =>
      _ResetPasswordSubmitChangeStepState();
}

class _ResetPasswordSubmitChangeStepState
    extends State<ResetPasswordSubmitChangeStep> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Şifreniz en az 6 karakter uzunluğunda olmalıdır.",
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.titleMedium?.fontSize)),
       /* RegisterPasswordFormField(
            passwordTextController: widget.passwordTextController),
        RegisterPasswordFormField(
            passwordTextController: widget.passwordConfirmTextController),*/
        Row(
          children: [
            Expanded(
              child: CommonElevationButton(
                child: const Padding(
                  padding: PagePadding.allHeight(),
                  child: Text("Change password"),
                ),
                onPressed: () => widget.resetPassword(),
              ),
            ),
          ],
        )
      ],
    );
  }
}
