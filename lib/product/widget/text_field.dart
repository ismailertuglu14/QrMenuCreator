import 'package:flutter/material.dart';

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
  }) : super(key: key);

  final TextEditingController? textController;
  final String? hintText;
  final bool? autofocus;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? label;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    //readOnly: ,
    return TextField(
      onSubmitted: onSubmitted,
      onTap: onTap,
      onChanged: onChanged,
      focusNode: focusNode,
      controller: textController,
      keyboardType: keyboardType,
      autofocus: autofocus ?? false,
      textInputAction: textInputAction,
      cursorRadius: const Radius.circular(20),
      cursorColor: Theme.of(context).colorScheme.onSurface,
      decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
              borderRadius: const PageBorderRadius.allMedium(),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.error)),
          filled: true,
          label: label,
          suffixIcon: suffixIcon,
          hintText: hintText,
          prefixIcon: prefixIcon,
          hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.surface.withOpacity(0.5)),
          fillColor: Theme.of(context).colorScheme.onSecondary,
          focusedBorder: OutlineInputBorder(
              borderRadius: const PageBorderRadius.allMedium(),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.secondary)),
          enabledBorder: OutlineInputBorder(
              borderRadius: const PageBorderRadius.allMedium(),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.secondary))),
      style: TextStyle(
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: Theme.of(context).textTheme.titleMedium?.fontSize),
    );
  }
}
