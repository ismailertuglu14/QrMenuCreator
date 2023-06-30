import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:qrmenu/core/constans/enum/route_keys.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/product/utility/border_radius.dart';
import 'package:qrmenu/product/utility/page_padding.dart';
import 'package:qrmenu/product/widget/app_bar.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';
import 'package:qrmenu/product/widget/text_field.dart';

import '../../../../product/widget/item_count_circle.dart';
part '../viewmodel/sections_view_model.dart';

class SectionsView extends StatefulWidget {
  const SectionsView({Key? key}) : super(key: key);

  @override
  State<SectionsView> createState() => _SectionsViewState();
}

class _SectionsViewState extends SectionsViewModel {
  bool isSorting = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: PagePadding.allDefault(),
        child: CommonElevationButton(
            onPressed: () => showDialog(
                context: context,
                builder: (context) => Dialog(
                      child: Padding(
                        padding: PagePadding.allHeight(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: PagePadding.allHeight(),
                              child: Text(
                                "Add Section",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        context.text.titleLarge?.fontSize),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            CommonTextField(
                              label: Text("Section Name"),
                              textController: _sectionController,
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
                                  children: List.generate(
                                      _sectionSuggestionList.length, (index) {
                                {
                                  var section = _sectionSuggestionList[index];
                                  bool isSelected = false;
                                  if (_selectedSection != null &&
                                      _selectedSection!.isNotEmpty) {
                                    isSelected = true;
                                  }

                                  return GestureDetector(
                                      onTap: () {
                                        _sectionController.text = section;
                                        setState(() {});
                                      },
                                      child: Padding(
                                          padding: const PagePadding.allMin(),
                                          child: Chip(
                                            side: BorderSide(
                                                style: BorderStyle.solid,
                                                color: Colors.transparent,
                                                width: 1),
                                            labelStyle: TextStyle(
                                                color: isSelected
                                                    ? context
                                                        .colorScheme.primary
                                                    : context
                                                        .colorScheme.surface
                                                        .withOpacity(0.5)),
                                            label: Text(section),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 12),
                                            backgroundColor: Colors.transparent,
                                          )));
                                }
                              })),
                            )),
                            Padding(
                              padding: PagePadding.allDefault(),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  OutlinedButton(
                                      onPressed: () {
                                        context.pop();
                                        _sectionController.clear();
                                      },
                                      child: Padding(
                                        padding: PagePadding.horizontalHeight(),
                                        child: Text("Cancel"),
                                      )),
                                  CommonElevationButton(
                                    child: Padding(
                                      padding: PagePadding.horizontalHeight(),
                                      child: Text("Add"),
                                    ),
                                    onPressed: () {
                                      if (_sectionController.text.isNotEmpty) {
                                        _sections.add(_sectionController.text);
                                        _sectionController.clear();
                                        context.pop();
                                        setState(() {});
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "Please enter a section name");
                                      }
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
            child: Padding(
              padding: PagePadding.allMedium(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.add),
                  Text("Add Section"),
                ],
              ),
            )),
      ),
      appBar: CommonAppBar(
        title: Text("Sections"),
        action: [
          IconButton(onPressed: () {}, icon: Icon(Icons.color_lens_outlined)),
          IconButton(
              onPressed: () => context.push(RouterKeys.QR.route),
              icon: Icon(Icons.qr_code_rounded))
        ],
      ),
      body: ReorderableListView(
        header: Padding(
          padding: PagePadding.allDefault(),
          child: Text("Add section in your menu",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: context.text.titleMedium?.fontSize)),
        ),
        padding: PagePadding.allHeight(),
        children: _sections
            .map((item) => Padding(
                  key: Key(item),
                  padding: PagePadding.verticalDefault(),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: PageBorderRadius.allMedium()),
                    tileColor: context.colorScheme.surface.withOpacity(0.2),
                    onTap: () => context.push(RouterKeys.BRUNCH.route),
                    title: Text(item),
                    trailing: Wrap(
                      children: const [
                        ItemCountCircle(count: 5),
                        Icon(Icons.menu),
                      ],
                    ),
                  ),
                ))
            .toList(),
        onReorder: (int start, int current) {
          // dragging from top to bottom
          if (start < current) {
            int end = current - 1;
            String startItem = _sections[start];
            int i = 0;
            int local = start;
            do {
              _sections[local] = _sections[++local];
              i++;
            } while (i < end - start);
            _sections[end] = startItem;
          }
          // dragging from bottom to top
          else if (start > current) {
            String startItem = _sections[start];
            for (int i = start; i > current; i--) {
              _sections[i] = _sections[i - 1];
            }
            _sections[current] = startItem;
          }
          setState(() {});
        },
      ),
    );
  }
}
