import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrmenu/core/extension/context_extension.dart';

import '../utility/border_radius.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    Key? key,
    this.textController,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.focusNode,
    this.autofocus,
    this.label,
    this.onSubmitted,
    this.inputFormatters,
    this.enableInteractiveSelection,
    this.decoration,
    this.floatingLabelBehavior,
    this.floatingLabelAlignment,
    this.textAlign,
    this.enabled,
    this.hideInputDecoration,
  }) : super(key: key);

  final TextEditingController? textController;
  final String? hintText;
  final bool? autofocus;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? label;
  final bool? enabled;
  final FocusNode? focusNode;
  final TextAlign? textAlign;
  final bool? enableInteractiveSelection;
  final void Function()? onTap;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final InputDecoration? decoration;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final FloatingLabelAlignment? floatingLabelAlignment;
  final bool? hideInputDecoration;
  @override
  Widget build(BuildContext context) {
    //readOnly: ,
    return TextField(
      onSubmitted: onSubmitted,
      textAlign: textAlign ?? TextAlign.start,
      onTap: onTap,
      enabled: enabled,
      onChanged: onChanged,
      focusNode: focusNode,
      controller: textController,
      enableInteractiveSelection: enableInteractiveSelection,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      autofocus: autofocus ?? false,
      textInputAction: textInputAction,
      cursorRadius: const Radius.circular(20),
      cursorColor: context.colorScheme.onSurface,
      decoration: decoration ??
          InputDecoration(
              floatingLabelAlignment: floatingLabelAlignment,
              floatingLabelBehavior: floatingLabelBehavior,
              errorBorder: OutlineInputBorder(
                  borderRadius: const PageBorderRadius.allMedium(),
                  borderSide: BorderSide(color: context.colorScheme.error)),
              filled: true,
              label: label,
              suffixIcon: suffixIcon,
              hintText: hintText,
              prefixIcon: prefixIcon,
              hintStyle: TextStyle(
                  color: context.colorScheme.surface.withOpacity(0.5)),
              fillColor: context.colorScheme.onSecondary,
              focusedBorder: OutlineInputBorder(
                  borderRadius: const PageBorderRadius.allMedium(),
                  borderSide: BorderSide(
                      color: hideInputDecoration == null
                          ? context.colorScheme.secondary
                          : Colors.transparent)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: const PageBorderRadius.allMedium(),
                  borderSide: BorderSide(
                      color: hideInputDecoration == null
                          ? context.colorScheme.secondary
                          : Colors.transparent))),
      style: TextStyle(
          color: context.colorScheme.onSurface,
          fontSize: context.text.titleMedium?.fontSize),
    );
  }
}
