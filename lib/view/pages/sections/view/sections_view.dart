import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/enum/route_keys.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/product/utility/border_radius.dart';
import 'package:qrmenu/product/utility/page_padding.dart';
import 'package:qrmenu/product/widget/app_bar.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';
import 'package:qrmenu/product/widget/text_field.dart';

import '../../../../core/init/provider/section_provider.dart';
import '../../../../product/widget/item_count_circle.dart';
import '../widget/add_section_button.dart';
import '../widget/section_card.dart';
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
      bottomNavigationBar: Consumer<SectionProvider>(
          builder: (context, provider, child) => AddSectionButton(
              sectionSuggestionList: _sectionSuggestionList,
              provider: provider)),
      appBar: CommonAppBar(
        title: Text("Sections"),
        action: [
          IconButton(
              onPressed: () => context.push(RouterKeys.QR.route),
              icon: Icon(Icons.qr_code_rounded))
        ],
      ),
      body: Consumer<SectionProvider>(
        builder: (context, provider, child) => ReorderableListView.builder(
          shrinkWrap: true,
          padding: PagePadding.allDefault(),
          scrollController: ScrollController(),
          itemCount: provider.sectionList.length,
          header: Padding(
            padding: PagePadding.allDefault(),
            child: Text("Add section in your menu",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.text.titleMedium?.fontSize)),
          ),
          itemBuilder: (context, index) => SectionCard(
              key: UniqueKey(), sectionProvider: provider, index: index),
          onReorder: (oldIndex, newIndex) {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final item = provider.sectionList.removeAt(oldIndex);
            provider.sectionList.insert(newIndex, item);
          },
        ),
      ),
    );
  }
}
