import 'package:flutter/material.dart';
import 'package:qrmenu/product/regex/first_name_regex.dart';

import '../../../../product/widget/text_form_field.dart';

class RegisterFirstNameFormField extends StatelessWidget {
  const RegisterFirstNameFormField({
    super.key,
    required TextEditingController userNameTextController,
  }) : _userNameTextController = userNameTextController;

  final TextEditingController _userNameTextController;

  @override
  Widget build(BuildContext context) {
    return CommonTextFormField(
      obscureText: false,
      label: "First Name",
      validator: firstNameRegex,
      textController: _userNameTextController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      prefixIcon: const Icon(Icons.person_2_rounded),
    );
  }
}
