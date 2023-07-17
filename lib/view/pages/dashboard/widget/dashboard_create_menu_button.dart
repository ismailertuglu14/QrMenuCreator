import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/init/provider/dashboard_provider.dart';

import '../../../../product/utility/zoom_tap_animation.dart';
import 'create_menu_dialog.dart';

class DashboardCreateMenuButton extends StatelessWidget {
  const DashboardCreateMenuButton(
      {super.key,
      required this.createMenu,
      required this.imagePicker,
      required this.uploadFile,
      required this.menuNameController});
  final Future<void> Function() createMenu;
  final ImagePicker imagePicker;
  final TextEditingController menuNameController;
  final Future<void> Function({required Object fileObject}) uploadFile;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      child: Consumer<DashboardProvider>(
        builder: (context, provider, child) => FloatingActionButton(
            onPressed: () => createMenuDialog(context, provider,
                menuNameController: menuNameController,
                createMenu: createMenu,
                imagePicker: imagePicker,
                uploadFile: uploadFile),
            child: Icon(Icons.add_rounded)),
      ),
    );
  }
}
