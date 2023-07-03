import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';

import '../../../../core/constans/enum/image_keys.dart';

class CreateItemSwitchTileBuilder extends StatelessWidget {
  const CreateItemSwitchTileBuilder({
    super.key,
    this.leading,
    required this.title,
    this.subtitle,
    required this.secondary,
    this.isThreeLine,
    required this.value,
    this.onChanged,
  });
  final Widget? leading;
  final String title;
  final Widget? subtitle;
  final ImageKeys secondary;
  final bool? isThreeLine;
  final bool value;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(
        title,
        style: TextStyle(color: context.colorScheme.surface),
      ),
      secondary: secondary.imageAsset(width: context.width * 0.1),
      controlAffinity: ListTileControlAffinity.trailing,
    );
  }
}
