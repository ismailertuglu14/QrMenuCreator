import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:qrmenu/core/extension/context_extension.dart';

import '../../../../product/utility/border_radius.dart';

class OtpCodeTextField extends StatefulWidget {
  const OtpCodeTextField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  State<OtpCodeTextField> createState() => _OtpCodeTextFieldState();
}

class _OtpCodeTextFieldState extends State<OtpCodeTextField> {
  final focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();
  }

  bool showError = false;

  @override
  Widget build(BuildContext context) {
    const length = 6;
    final borderColor = context.colorScheme.primary;
    const fillColor = Colors.transparent;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: const PageBorderRadius.allMin(),
        border: Border.all(color: borderColor),
      ),
    );

    return SizedBox(
      height: 68,
      child: Pinput(
        length: length,
        controller: widget.controller,
        focusNode: focusNode,
        autofocus: true,
        androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: defaultPinTheme.copyWith(
          height: 56,
          width: 64,
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: borderColor),
            borderRadius: const PageBorderRadius.allMin(),
          ),
        ),
      ),
    );
  }
}
