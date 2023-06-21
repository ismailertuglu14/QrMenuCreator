import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/context_extension.dart';

class UserCircleAvatar extends StatelessWidget {
  const UserCircleAvatar({
    Key? key,
    this.onTap,
    this.child,
    this.maxRadius = 30,
    this.minRadius = 10,
    this.backgroundImage,
    this.radius,
  }) : super(key: key);
  final Widget? child;
  final double maxRadius;
  final double minRadius;
  final double? radius;
  final void Function()? onTap;
  final ImageProvider<Object>? backgroundImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        maxRadius: maxRadius,
        minRadius: minRadius,
        radius: radius,
        backgroundImage: backgroundImage,
        foregroundColor: (context).colorScheme.onSecondary,
        backgroundColor: (context).colorScheme.onSecondary,
        child: child,
      ),
    );
  }
}
