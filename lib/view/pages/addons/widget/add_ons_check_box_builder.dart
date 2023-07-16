import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/image_icon_extenison.dart';
import 'package:qrmenu/view/pages/addons/widget/add_ons_dialog.dart';

import '../../../../core/constans/enum/image_keys.dart';
import '../model/ons_preview_model.dart';

class AddOnsCheckBoxListTileBuilder extends StatelessWidget {
  const AddOnsCheckBoxListTileBuilder({
    super.key,
    required this.title,
    required this.subTitle,
    required this.value,
    this.onChanged,
    required this.price,
    required this.removeOnsPreviewList,
    required this.index,
    required this.titleController,
    required this.descriptionController,
    required this.priceController,
  });
  final String title;
  final String subTitle;
  final bool value;
  final int price;
  final int index;
  final void Function(bool?)? onChanged;
  final void Function(int index) removeOnsPreviewList;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      title: Text(title),
      secondary: Row(mainAxisSize: MainAxisSize.min, children: [
        Flexible(
            child: Text(
          "$price TL",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: context.colorScheme.primaryContainer),
        )),
        Flexible(
            child: PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
                onTap: () => addOnsDialog(context, titleController,
                    descriptionController, priceController),
                value: 1,
                child: ListTile(
                  title: Text("Edit Addon"),
                  leading: ImageKeys.edit.imageIcon(
                    color: context.colorScheme.surface,
                  ),
                )),
            PopupMenuItem(
                onTap: () => removeOnsPreviewList(index),
                value: 2,
                child: ListTile(
                  textColor: context.colorScheme.error,
                  title: Text("Delete Addon"),
                  leading: ImageKeys.delete.imageIcon(
                    color: context.colorScheme.error,
                  ),
                )),
          ],
        ))
      ]),
      controlAffinity: ListTileControlAffinity.leading,
      subtitle: Text(subTitle),
      onChanged: onChanged,
    );
  }
}
