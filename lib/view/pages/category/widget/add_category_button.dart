import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/init/provider/category_provider.dart';
import 'package:qrmenu/product/widget/bottom_sheet_button.dart';

import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/elevation_button.dart';
import 'add_category_dialog.dart';

class AddSectionButton extends StatelessWidget {
  const AddSectionButton(
      {super.key,
      required this.sectionSuggestionList,
      required this.createCategory,
      required this.imagePicker,
      required this.uploadFile});
  final List<String> sectionSuggestionList;
  final Future<void> Function() createCategory;
  final ImagePicker imagePicker;
  final Future<void> Function({required Object fileObject}) uploadFile;

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, provider, child) => BottomSheetButton(
        onPressed: () => addCategoryDialog(
            context, imagePicker, sectionSuggestionList, provider,
            createCategory: createCategory, uploadFile: uploadFile),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.add),
            Text("Add Section"),
          ],
        ),
      ),
    );
  }
}
