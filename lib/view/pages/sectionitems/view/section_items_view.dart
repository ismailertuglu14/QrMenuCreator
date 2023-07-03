import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/enum/route_keys.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/core/init/provider/section_items_provider.dart';
import 'package:qrmenu/product/widget/app_bar.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';
import 'package:qrmenu/product/widget/user_circle_avatar.dart';

import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/bottom_sheet_button.dart';
import '../widget/section_item_card.dart';
part '../viewmodel/section_items_view_model.dart';

class SectionItemsView extends StatefulWidget {
  const SectionItemsView({super.key, this.title});
  final String? title;
  @override
  State<SectionItemsView> createState() => _SectionItemsViewState();
}

class _SectionItemsViewState extends SectionItemsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomSheetButton(
        child: Text("Add Selection Item"),
        onPressed: () => context.push(RouterKeys.CREATE_ITEM.route),
      ),
      appBar: CommonAppBar(title: Text(widget.title ?? "Section Items")),
      body: Consumer<SectionItemsProvider>(
        builder: (context, provider, child) => ReorderableListView.builder(
          itemCount: provider.sectionList.length,
          header: Padding(
            padding: PagePadding.allDefault(),
            child: Text("Add items in sections",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.text.titleMedium?.fontSize)),
          ),
          padding: PagePadding.allHeight(),
          itemBuilder: (context, index) => SectionItemCard(
              key: ValueKey(index), index: index, provider: provider),
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
