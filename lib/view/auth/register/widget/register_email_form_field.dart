import 'package:flutter/material.dart';
import 'package:qrmenu/product/regex/email_regex.dart';

import '../../../../product/widget/text_form_field.dart';

class RegisterEmailFormField extends StatelessWidget {
  const RegisterEmailFormField({
    super.key,
    required TextEditingController emailTextController,
  }) : _emailTextController = emailTextController;

  final TextEditingController _emailTextController;

  @override
  Widget build(BuildContext context) {
    return CommonTextFormField(
      obscureText: false,
      label: "Email adress",
      validator: emailRegex,
      textController: _emailTextController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      prefixIcon: const Icon(Icons.alternate_email_rounded),
    );
  }
}
