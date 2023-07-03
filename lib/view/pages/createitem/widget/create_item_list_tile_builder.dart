import 'package:flutter/material.dart';

class CreateItemListTileBuilder extends StatelessWidget {
  const CreateItemListTileBuilder({
    super.key,
    this.leading,
    this.title,
    this.trailing,
    this.onTap,
  });
  final Widget? leading;
  final Widget? title;
  final Widget? trailing;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: leading,
      onTap: onTap,
      title: title,
      trailing: trailing,
    );
  }
}
