import 'package:flutter/material.dart';

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
  });
  final String title;
  final String subTitle;
  final bool value;
  final int price;
  final void Function(bool?)? onChanged;
  final void Function(OnsPreviewModel onsPreviewModel) removeOnsPreviewList;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      title: Text(title),
      secondary: Column(children: [
        Flexible(child: Text("USD $price")),
        Flexible(
            child: PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(onTap: () {}, value: 2, child: Text("Edit")),
            PopupMenuItem(
                onTap: () => removeOnsPreviewList,
                value: 1,
                child: Text("Delete")),
          ],
        ))
      ]),
      controlAffinity: ListTileControlAffinity.leading,
      subtitle: Text(subTitle),
      onChanged: onChanged,
    );
  }
}
