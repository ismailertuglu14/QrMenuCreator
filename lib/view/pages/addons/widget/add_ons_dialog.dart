import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/init/provider/add_ons_provider.dart';
import 'package:qrmenu/view/pages/addons/model/ons_preview_model.dart';

import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/elevation_button.dart';
import '../../../../product/widget/text_field.dart';

Future<dynamic> addOnsDialog(
    BuildContext context,
    TextEditingController titleController,
    TextEditingController descriptionController,
    TextEditingController priceController) {
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Expanded(
        child: Padding(
          padding: PagePadding.allMedium(),
          child: Consumer<AddOnsProvider>(
            builder: (context, provider, child) => Wrap(children: [
              Padding(
                padding: PagePadding.allMedium(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add a new Addon",
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
              Expanded(
                  child: Padding(
                padding: PagePadding.allDefault(),
                child: CommonTextField(
                  textController: titleController,
                  hintText: "Name",
                ),
              )),
              Expanded(
                  child: Padding(
                padding: PagePadding.allDefault(),
                child: CommonTextField(
                  textController: descriptionController,
                  hintText: "Description",
                ),
              )),
              Padding(
                padding: PagePadding.allDefault(),
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text(
                          "USD",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: context.text.titleMedium?.fontSize),
                        )),
                    Expanded(
                        flex: 8,
                        child: Padding(
                          padding: PagePadding.allDefault(),
                          child: CommonTextField(
                            textAlign: TextAlign.center,
                            textController: priceController,
                            hintText: "Price",
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                          ),
                        ))
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: PagePadding.allMedium(),
                      child: CommonElevationButton(
                          child: Padding(
                            padding: PagePadding.allMedium(),
                            child: Text("Save"),
                          ),
                          onPressed: () {
                            if (titleController.text.isNotEmpty &&
                                descriptionController.text.isNotEmpty &&
                                priceController.text.isNotEmpty) {
                              provider.addOnsPreviewList(OnsPreviewModel(
                                  title: titleController.text,
                                  subTitle: descriptionController.text,
                                  price: int.parse(priceController.text),
                                  isSelected: false));
                              context.pop();
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Please fill all fields");
                            }
                          }),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    ),
  );
}
