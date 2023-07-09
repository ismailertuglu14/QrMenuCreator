import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/product/utility/page_padding.dart';
import 'package:qrmenu/product/widget/text_field.dart';

class NutritionFactsCheckBoxBuilder extends StatelessWidget {
  const NutritionFactsCheckBoxBuilder({
    super.key,
    required this.title,
    required this.value,
    this.onChanged,
    this.hintText,
    this.enabled,
    this.onTapField,
    this.onChangedField,
  });
  final String title;

  final bool value;
  final bool? enabled;
  final String? hintText;
  final void Function(String)? onChangedField;

  final void Function()? onTapField;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.allMin(),
      child: CheckboxListTile(
        contentPadding: EdgeInsets.zero,
        value: value,
        onChanged: onChanged,
        title: Text(title),
        secondary: SizedBox(
            width: context.width / 5,
            child: CommonTextField(
              onTap: onTapField,
              enabled: enabled ?? true,
              hintText: hintText ?? "0",
              onChanged: onChangedField,
              textAlign: TextAlign.center,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            )),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
