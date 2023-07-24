import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/product/widget/templates/celadon_menu_style.dart';

import '../../../../core/constans/enum/image_keys.dart';
import '../../../../core/constans/enum/lottie_keys.dart';
import '../../../../core/constans/enum/template_keys.dart';
import '../../../../core/constans/enum/upload_file_keys.dart';
import '../../../../core/init/provider/dashboard_provider.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/grid_delegates.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/close_keyboard.dart';
import '../../../../product/widget/elevation_button.dart';
import '../../../../product/widget/outline_button.dart';
import '../../../../product/widget/text_field.dart';
import '../../../../product/widget/upload_file_dialog.dart';
import '../../category/model/get_category_response_model.dart';
import '../../products/model/get_products_by_category_id_response_model.dart';
import '../../templates/model/base_template_model.dart';
import '../../templates/widget/template_list.dart';

Future<dynamic> createMenuDialog(
    BuildContext context, DashboardProvider provider,
    {required Future<void> Function() createMenu,
    required TextEditingController menuNameController,
    required ImagePicker imagePicker,
    required Future<void> Function({required Object fileObject}) uploadFile}) {
  provider.setMenuImage = null;

  return showDialog(
      context: context,
      builder: (context) => Dialog(
            child: CloseKeyboard(
              child: Padding(
                padding: PagePadding.allMedium(),
                child: Consumer<DashboardProvider>(
                  builder: (context, provider, child) => Wrap(children: [
                    Padding(
                      padding: PagePadding.allMedium(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Create Menu",
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
                      hintText: "Menu Name",
                      textController: menuNameController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                    ),
                    Padding(
                      padding: PagePadding.verticalDefault(),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
                                child: ClipRRect(
                              borderRadius: PageBorderRadius.allMedium(),
                              child: Consumer<DashboardProvider>(
                                  builder: (context, provider, child) =>
                                      provider.menuImage == null
                                          ? ImageKeys.default_image.imageAsset(
                                              width: context.width / 4)
                                          : Image.file(
                                              File(provider.menuImage!.path),
                                              height: context.height / 10,
                                              width: context.width / 4,
                                              fit: BoxFit.cover,
                                            )),
                            )),
                            CommonOutlineButton(
                                onPressed: () => uploadFileDialog(
                                    context,
                                    imagePicker,
                                    false,
                                    UploadFileTypeKeys.SINGLE_IMAGE,
                                    uploadFile),
                                child: Text("Choose Image"))
                          ]),
                    ),
                 
                    Padding(
                      padding: PagePadding.verticalMedium(),
                      child: Row(
                        children: [
                          Consumer<DashboardProvider>(
                            builder: (context, provider, child) =>
                                provider.isLoading
                                    ? Center(
                                      child: LottieKeys.loading.path(
                                          width: context.width / 4,
                                          height: context.height / 15),
                                    )
                                    : Expanded(
                                        child: CommonElevationButton(
                                            child: Padding(
                                              padding: PagePadding.allMedium(),
                                              child: Text("Create"),
                                            ),
                                            onPressed: () {
                                              createMenu();
                                              menuNameController.text.isNotEmpty
                                                  ? context.pop()
                                                  : null;
                                            }),
                                      ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ));
}
