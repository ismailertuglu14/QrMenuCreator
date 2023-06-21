import 'package:flutter/material.dart';

import '../../../../product/widget/text_form_field.dart';

class RegisterPasswordFormField extends StatefulWidget {
  const RegisterPasswordFormField({
    super.key,
    required TextEditingController passwordTextController,
  }) : _passwordTextController = passwordTextController;

  final TextEditingController _passwordTextController;

  @override
  State<RegisterPasswordFormField> createState() =>
      _RegisterPasswordFormFieldState();
}

class _RegisterPasswordFormFieldState extends State<RegisterPasswordFormField> {
  bool _isPasswordVisible = true;
  void _changePasswordVisibility() =>
      setState(() => _isPasswordVisible = !_isPasswordVisible);
  @override
  Widget build(BuildContext context) {
    return CommonTextFormField(
        label: "Password",
        obscureText: _isPasswordVisible,
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value!.isNotEmpty) {
            if (value.contains(RegExp(r'^\S+$'))) {
              if (value.contains(RegExp(r'^[a-zA-Z0-9_-]{3,64}$'))) {
              } else {
                return "Şifreniz 3-64 karakter olmalıdır";
              }
            } else {
              return "Şifreniz boşluk içermemeli";
            }
          } else {
            return "Şifre giriniz";
          }
          return null;
        },
        textController: widget._passwordTextController,
        keyboardType: TextInputType.visiblePassword,
        prefixIcon: const Icon(Icons.key_outlined),
        suffixIcon: IconButton(
            onPressed: () => _changePasswordVisibility(),
            icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off)));
  }
}
