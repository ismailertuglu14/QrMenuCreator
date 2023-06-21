import 'package:flutter/material.dart';

import '../../../../core/init/provider/register_provider.dart';
import '../../../../product/regex/name_regex.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/text_form_field.dart';

class RegisterPersonelStep extends StatelessWidget {
  const RegisterPersonelStep({
    super.key,
    required this.firstNameTextController,
    required this.lastNameTextController,
    required this.registerProvider,
    required this.contactNumberTextController,
  });

  final TextEditingController firstNameTextController;
  final TextEditingController lastNameTextController;
  final RegisterProvider registerProvider;
  final TextEditingController contactNumberTextController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const PagePadding.allDefault(),
          child: CommonTextFormField(
            obscureText: false,
            label: "First Name",
            validator: nameRegex,
            textController: firstNameTextController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            prefixIcon: const Icon(Icons.person_2_rounded),
          ),
        ),
        Padding(
          padding: const PagePadding.allDefault(),
          child: CommonTextFormField(
            obscureText: false,
            label: "Last Name",
            validator: nameRegex,
            textController: lastNameTextController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            prefixIcon: const Icon(Icons.group_rounded),
          ),
        ),
        Padding(
          padding: const PagePadding.allDefault(),
          child: CommonTextFormField(
            obscureText: false,
            label: "Contact Number",
            validator: nameRegex,
            textController: contactNumberTextController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.name,
            prefixIcon: const Icon(Icons.phone_rounded),
          ),
        ),
      ],
    );
  }
}
