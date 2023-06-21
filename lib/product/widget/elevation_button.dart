import 'package:flutter/material.dart';

class CommonElevationButton extends StatelessWidget {
  const CommonElevationButton(
      {super.key, required this.child, required this.onPressed, this.style});
  final Widget child;
  final void Function()? onPressed;
  final ButtonStyle? style;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary),
        onPressed: onPressed,
        child: child);
  }
}
