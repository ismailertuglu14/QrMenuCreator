import 'package:flutter/material.dart';
import 'package:qrmenu/product/regex/last_name_regex.dart';

import '../../../../product/widget/text_form_field.dart';

class RegisterLastNameFormField extends StatelessWidget {
  const RegisterLastNameFormField({
    super.key,
    required TextEditingController userNameTextController,
  }) : _userNameTextController = userNameTextController;

  final TextEditingController _userNameTextController;

  @override
  Widget build(BuildContext context) {
    return CommonTextFormField(
      obscureText: false,
      label: "Last Name",
      validator: lastNameRegex,
      textController: _userNameTextController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      prefixIcon: const Icon(Icons.group_rounded),
    );
  }
}
