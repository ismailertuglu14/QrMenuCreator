import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/core/constans/enum/lottie_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/core/init/provider/category_provider.dart';
import 'package:qrmenu/product/utility/border_radius.dart';
import 'package:qrmenu/product/widget/upload_file_dialog.dart';

import '../../../../core/constans/enum/upload_file_keys.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/elevation_button.dart';
import '../../../../product/widget/text_field.dart';

Future<dynamic> addCategoryDialog(BuildContext context, ImagePicker imagePicker,
    List<String> sectionSuggestionList, CategoryProvider provider,
    {required Future<void> Function() createCategory,
    required Future<void> Function({required Object fileObject}) uploadFile}) {
  provider.setSelectedSuggestionIndex = null;
  provider.setCategoryImage = null;
  return showDialog(
      context: context,
      builder: (context) => Dialog(
              child: Padding(
            padding: PagePadding.allHeight(),
            child: Consumer<CategoryProvider>(
              builder: (context, provider, child) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: PagePadding.allMedium(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add Category",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: context.text.titleLarge?.fontSize),
                          textAlign: TextAlign.center,
                        ),
                        IconButton(
                            onPressed: () => context.pop(),
                            icon: Icon(Icons.close)),
                      ],
                    ),
                  ),
                  CommonTextField(
                    label: Text("Category Name"),
                    textController: provider.categoryController,
                    keyboardType: TextInputType.name,
                    prefixIcon: Icon(Icons.category_outlined),
                    textInputAction: TextInputAction.done,
                  ),
                  Padding(
                    padding: PagePadding.allDefault(),
                    child: Text(
                      "Suggestions",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                      child: SingleChildScrollView(
                    child: Wrap(
                        children: List.generate(sectionSuggestionList.length,
                            (index) {
                      {
                        var section = sectionSuggestionList[index];

                        return GestureDetector(
                            onTap: () {
                              if (provider.selectedSuggestionIndex == index) {
                                provider.setSelectedSuggestionIndex = null;
                                provider.categoryController.clear();
                              } else {
                                provider.categoryController.text = section;
                                provider.setSelectedSuggestionIndex = index;
                              }
                            },
                            child: Padding(
                                padding: const PagePadding.allMin(),
                                child: Chip(
                                  side: BorderSide(
                                      style: BorderStyle.solid,
                                      color: provider.selectedSuggestionIndex ==
                                              index
                                          ? context.colorScheme.primary
                                          : Colors.transparent,
                                      width: 1),
                                  labelStyle: TextStyle(
                                      color: provider.selectedSuggestionIndex ==
                                              index
                                          ? context.colorScheme.primary
                                          : context.colorScheme.surface
                                              .withOpacity(0.5)),
                                  label: Text(section),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 12),
                                  backgroundColor: Colors.transparent,
                                )));
                      }
                    })),
                  )),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                            child: ClipRRect(
                          borderRadius: PageBorderRadius.allMedium(),
                          child: Consumer<CategoryProvider>(
                              builder: (context, provider, child) =>
                                  provider.categoryImage == null
                                      ? ImageKeys.default_image
                                          .imageAsset(width: context.width / 4)
                                      : Image.file(
                                          File(provider.categoryImage!.path),
                                          height: context.height / 10,
                                          width: context.width / 4,
                                          fit: BoxFit.cover,
                                        )),
                        )),
                        OutlinedButton(
                            onPressed: () => uploadFileDialog(
                                context,
                                imagePicker,
                                false,
                                UploadFileTypeKeys.SINGLE_IMAGE,
                                uploadFile),
                            child: Text("Choose Image"))
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Consumer<CategoryProvider>(
                          builder: (context, provider, child) =>
                              provider.isLoading
                                  ? LottieKeys.loading
                                      .path(height: context.height / 20)
                                  : CommonElevationButton(
                                      child: Padding(
                                        padding: PagePadding.horizontalHeight(),
                                        child: Text("Add"),
                                      ),
                                      onPressed: () => createCategory.call(),
                                    ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )));
}
