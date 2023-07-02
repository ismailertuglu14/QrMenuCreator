import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qrmenu/core/constans/enum/route_keys.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/router_extension.dart';

import '../../../../core/init/provider/section_provider.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/item_count_circle.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({
    super.key,
    required SectionProvider sectionProvider,
    required this.index,
  }) : _sectionProvider = sectionProvider;

  final SectionProvider _sectionProvider;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.allDefault(),
      child: ListTile(
        onTap: () => context.push(RouterKeys.BRUNCH.route),
        title: Text(_sectionProvider.sectionList[index]),
        tileColor: context.colorScheme.secondary.withOpacity(0.1),
        trailing: SizedBox(
          width: context.width * 0.3,
          child: Row(
            children: [
              Expanded(flex: 8, child: ItemCountCircle(count: 5)),
              Expanded(
                flex: 2,
                child: PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      onTap: () {},
                      child: Text("Edit"),
                    ),
                    PopupMenuItem(
                      onTap: () => _sectionProvider.removeSection(index),
                      value: 2,
                      child: Text("Delete"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
