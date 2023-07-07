import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';

import '../../../../core/constans/enum/image_keys.dart';
import '../../../../product/widget/custom_switch_list_tile.dart';

class CreateItemSwitchTileBuilder extends StatelessWidget {
  const CreateItemSwitchTileBuilder({
    super.key,
    required this.title,
    this.subtitle,
    this.isThreeLine,
    required this.value,
    required this.onChanged,
    required this.leading,
  });

  final String title;
  final Widget? subtitle;
  final ImageKeys leading;
  final bool? isThreeLine;
  final bool value;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTileSwitch(
      switchActiveColor: context.colorScheme.primary,
      value: value,
      onChanged: onChanged,
      title: Text(
        title,
        style: TextStyle(color: context.colorScheme.surface),
      ),
      leading: leading.imageAsset(width: context.width * 0.1),
    );
  }
}
