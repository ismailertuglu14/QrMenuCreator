import 'package:flutter/material.dart';

import '../../../../product/utility/zoom_tap_animation.dart';
import 'create_menu_dialog.dart';

class DashboardCreateMenuButton extends StatelessWidget {
  const DashboardCreateMenuButton({super.key, required this.createMenu});
  final Future<void> Function() createMenu;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
          child: FloatingActionButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) => CreateMenuDialog(
            
                      createMenu: createMenu)),
              child: Icon(Icons.add_rounded)),
        );
  }
}