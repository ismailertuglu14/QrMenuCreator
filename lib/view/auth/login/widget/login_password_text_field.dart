import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/init/provider/login_provider.dart';
import '../../../../product/regex/password_regex.dart';
import '../../../../product/widget/text_form_field.dart';

class LoginPasswordTextField extends StatelessWidget {
  const LoginPasswordTextField({
    super.key,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Consumer<LoginProvider>(
          builder: (context, value, child) => CommonTextFormField(
            label: "Password",
            validator: passwordRegex,
            textInputAction: TextInputAction.done,
            autovalidateMode: value.autovalidateMode,
            obscureText: value.visiblePassword,
            textController: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: const Icon(Icons.password_rounded),
            suffixIcon: IconButton(
                onPressed: () => value.changeVisiblePassword(),
                icon: value.visiblePassword
                    ? Icon(Icons.visibility_rounded)
                    : Icon(Icons.visibility_off_rounded)),
          ),
        ));
  }
}
