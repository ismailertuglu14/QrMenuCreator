import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/init/provider/register_provider.dart';
import '../../../../product/regex/name_regex.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/countrycodepicker/country_code_picker.dart';
import '../../../../product/widget/text_form_field.dart';

class RegisterPersonelStep extends StatelessWidget {
  const RegisterPersonelStep({
    super.key,
    required this.businessTextController,
    required this.registerProvider,
    required this.contactNumberTextController,
  });

  final TextEditingController businessTextController;

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
            label: "Business Name",
            validator: nameRegex,
            textController: businessTextController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            prefixIcon: const Icon(Icons.person_2_rounded),
          ),
        ),
        Padding(
          padding: const PagePadding.allDefault(),
          child: CommonTextFormField(
            obscureText: false,
            label: "Contact Number",
            validator: nameRegex,
            textController: contactNumberTextController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            prefixIcon: CountryCodePicker(
              onChanged: (value) =>
                  registerProvider.changeSelectedCountryCode(value),
              initialSelection: 'IT',
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              alignLeft: false,
            ),
          ),
        ),
      ],
    );
  }
}
