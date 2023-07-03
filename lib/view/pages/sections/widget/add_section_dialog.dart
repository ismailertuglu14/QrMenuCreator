import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/init/provider/section_provider.dart';

import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/elevation_button.dart';
import '../../../../product/widget/text_field.dart';

Future<dynamic> addSectionDialog(BuildContext context,
    List<String> sectionSuggestionList, SectionProvider provider) {
  provider.selectedSuggestionIndex = null;
  return showDialog(
      context: context,
      builder: (context) => Dialog(
              child: Padding(
            padding: PagePadding.allHeight(),
            child: Consumer<SectionProvider>(
              builder: (context, provider, child) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: PagePadding.allMedium(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add Section",
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
                    label: Text("Section Name"),
                    textController: provider.sectionController,
                    keyboardType: TextInputType.name,
                    prefixIcon: Icon(Icons.category_outlined),
                    textInputAction: TextInputAction.done,
                  ),
                  Divider(),
                  Text(
                    "Suggestions",
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                                provider.selectedSuggestionIndex = null;
                                provider.sectionController.clear();
                              } else {
                                provider.sectionController.text = section;
                                provider.selectedSuggestionIndex = index;
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: CommonElevationButton(
                          child: Padding(
                            padding: PagePadding.horizontalHeight(),
                            child: Text("Add"),
                          ),
                          onPressed: () {
                            if (provider.sectionController.text.isNotEmpty) {
                              provider
                                  .addSection(provider.sectionController.text);
                              provider.sectionController.clear();

                              context.pop();
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Please enter a section name");
                            }
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )));
}
