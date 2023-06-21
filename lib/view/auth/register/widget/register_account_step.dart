import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/init/provider/register_provider.dart';

import '../../../../product/regex/email_regex.dart';
import '../../../../product/regex/password_regex.dart';
import '../../../../product/regex/username_regex.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/text_form_field.dart';

class RegisterAccountStep extends StatelessWidget {
  const RegisterAccountStep({
    super.key,
    required this.userName,
    required this.emailTextController,
    required this.passwordTextController,
    required this.registerProvider,
  });
  final String userName;
  final TextEditingController emailTextController;

  final TextEditingController passwordTextController;
  final RegisterProvider registerProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const PagePadding.allDefault(),
          child: CommonTextFormField(
            obscureText: false,
            label: "Email adress",
            validator: emailRegex,
            textController: emailTextController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: const Icon(Icons.alternate_email_rounded),
          ),
        ),
        Padding(
            padding: const PagePadding.allDefault(),
            child: Consumer<RegisterProvider>(
              builder: (context, value, child) => CommonTextFormField(
                label: "Password",
                obscureText: value.isPasswordVisible,
                textInputAction: TextInputAction.done,
                validator: passwordRegex,
                textController: passwordTextController,
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: const Icon(Icons.key_outlined),
                suffixIcon: IconButton(
                    onPressed: () =>
                        registerProvider.changePasswordVisibility(),
                    icon: Icon(value.isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off)),
              ),
            ))
      ],
    );
  }
}
