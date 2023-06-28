import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/init/provider/theme_provider.dart';
import '../utility/border_radius.dart';

class CommonTextFormField extends StatelessWidget {
  const CommonTextFormField({
    super.key,
    required this.textController,
    this.keyboardType,
    this.textInputAction,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.onTap,
    this.onChanged,
    this.obscureText,
    this.label,
    this.validator,
    this.hintText,
    this.errorText,
    this.autovalidateMode,
  });
  final String? hintText;
  final String? label;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  final String? errorText;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      onChanged: onChanged,
      validator: validator,
      focusNode: focusNode,
      keyboardAppearance:
          context.watch<ThemeProvider>().getThemeMode == ThemeMode.dark
              ? Brightness.dark
              : Brightness.light,
      keyboardType: keyboardType,
      autovalidateMode: autovalidateMode,
      controller: textController,
      textInputAction: textInputAction,
      obscureText: obscureText ?? false,
      cursorRadius: const Radius.circular(20),
      cursorColor: context.colorScheme.onSurface,
      decoration: InputDecoration(
          errorMaxLines: 1,
          errorText: errorText,
          hintText: hintText,
          filled: true,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          label: Text(label ?? ""),
          errorBorder: OutlineInputBorder(
              borderRadius: const PageBorderRadius.allMedium(),
              borderSide: BorderSide(color: context.colorScheme.error)),
          hintStyle:
              TextStyle(color: context.colorScheme.surface.withOpacity(0.5)),
          fillColor: context.colorScheme.onSecondary,
          focusedBorder: OutlineInputBorder(
              borderRadius: const PageBorderRadius.allMedium(),
              borderSide: BorderSide(color: context.colorScheme.secondary)),
          enabledBorder: OutlineInputBorder(
              borderRadius: const PageBorderRadius.allMedium(),
              borderSide: BorderSide(color: context.colorScheme.secondary))),
      style: TextStyle(
          color: context.colorScheme.onSurface,
          fontSize: context.text.titleMedium?.fontSize),
    );
  }
}
