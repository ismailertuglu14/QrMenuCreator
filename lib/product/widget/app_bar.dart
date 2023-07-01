import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar(
      {Key? key,
      this.title,
      this.action,
      this.leading,
      this.bottom,
      this.toolbarHeight,
      this.automaticallyImplyLeading})
      : super(key: key);
  final Widget? title;
  final List<Widget>? action;
  final Widget? leading;
  final double? toolbarHeight;
  final bool? automaticallyImplyLeading;

  final PreferredSizeWidget? bottom;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      bottom: bottom,
      leading: leading,
      actions: action,
      centerTitle: true,
      toolbarHeight: toolbarHeight,
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
    );
  }
}
