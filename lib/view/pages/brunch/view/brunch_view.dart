import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qrmenu/core/constans/enum/route_keys.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/product/widget/app_bar.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';

import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';
part '../viewmodel/brunch_view_model.dart';

class BrunchView extends StatefulWidget {
  const BrunchView({Key? key}) : super(key: key);

  @override
  State<BrunchView> createState() => _BrunchViewState();
}

class _BrunchViewState extends BrunchViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: PagePadding.allDefault(),
        child: CommonElevationButton(
          child: Padding(
            padding: PagePadding.allHeight(),
            child: Text("Add Selection Item"),
          ),
          onPressed: () => context.push(RouterKeys.CREATE_ITEM.route),
        ),
      ),
      appBar: CommonAppBar(title: Text("Brunch")),
      body: ReorderableListView(
        header: Padding(
          padding: PagePadding.allDefault(),
          child: Text("Add items in sections",
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
                      children: [
                        Padding(
                          padding: PagePadding.horizontalLow(),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: context.colorScheme.primary),
                            child: Padding(
                              padding: PagePadding.allMin(),
                              child: Text("5"),
                            ),
                          ),
                        ),
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
