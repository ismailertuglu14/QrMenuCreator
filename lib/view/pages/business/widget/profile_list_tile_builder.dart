import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/image_icon_extenison.dart';

import '../../../../core/constans/enum/image_keys.dart';

class ProfileListTileBuilder extends StatelessWidget {
  const ProfileListTileBuilder({
    super.key,
    required this.title,
    required this.leading,
    this.trailing,
    this.onTap,
  });
  final String title;
  final ImageKeys leading;
  final Widget? trailing;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: leading.imageIcon(color: context.colorScheme.surface),
        trailing: trailing,
      ),
    );
  }
}
