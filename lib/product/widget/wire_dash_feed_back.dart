import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

class WiredashFeedBack extends StatelessWidget {
  const WiredashFeedBack({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: "projectId",
      secret: "secret",
      child: child,
    );
  }
}
