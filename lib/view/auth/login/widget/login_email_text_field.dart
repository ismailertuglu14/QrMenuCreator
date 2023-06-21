import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/init/provider/login_provider.dart';
import '../../../../product/regex/email_regex.dart';
import '../../../../product/widget/text_form_field.dart';

class LoginEmailTextField extends StatelessWidget {
  const LoginEmailTextField({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Consumer<LoginProvider>(
          builder: (context, value, child) => CommonTextFormField(
            label: "Email",
            validator: emailRegex,
            textController: _emailController,
            autovalidateMode: value.autovalidateMode,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: const Icon(Icons.alternate_email_rounded),
          ),
        ));
  }
}
