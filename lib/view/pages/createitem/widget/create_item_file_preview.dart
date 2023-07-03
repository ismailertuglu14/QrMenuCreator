import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/context_extension.dart';

import '../../../../core/constans/enum/upload_file_keys.dart';
import '../../../../core/init/provider/create_item_provider.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/upload_file_dialog.dart';

class CreateItemPreviewFiles extends StatelessWidget {
  const CreateItemPreviewFiles(
      {super.key, required this.imagePicker, required this.uploadObject});
  final ImagePicker imagePicker;
  final Future<void> Function({required Object fileObject}) uploadObject;
  @override
  Widget build(BuildContext context) {
    return Consumer<CreateItemProvider>(
      builder: (context, provider, child) => PageView.builder(
          onPageChanged: (index) => provider.changeItemImageCurentIndex(index),
          itemCount: provider.itemPreviewList.length + 1,
          itemBuilder: (context, index) {
            return (index != provider.itemPreviewList.length &&
                    provider.itemPreviewList.isNotEmpty)
                ? Padding(
                    padding: PagePadding.allMedium(),
                    child: ClipRRect(
                      borderRadius: PageBorderRadius.allDefault(),
                      child: Image.file(
                        File(provider.itemPreviewList[index].path),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () => uploadFileDialog(context, imagePicker, false,
                        UploadFileTypeKeys.MULTIPLE_IMAGE, uploadObject),
                    child: Padding(
                      padding: PagePadding.allDefault(),
                      child: Container(
                        decoration: BoxDecoration(
                            color: context.colorScheme.surface.withOpacity(0.5),
                            borderRadius: PageBorderRadius
                                .allDefault()), //color: Colors.red),

                        child: Icon(Icons.camera_enhance_outlined),
                      ),
                    ),
                  );
          }),
    );
  }
}
