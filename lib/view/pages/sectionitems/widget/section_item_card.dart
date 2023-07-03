import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/core/init/provider/section_items_provider.dart';

import '../../../../core/constans/enum/route_keys.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/user_circle_avatar.dart';

class SectionItemCard extends StatelessWidget {
  const SectionItemCard({
    super.key,
    required this.provider,
    required this.index,
  });
  final SectionItemsProvider provider;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.allDefault(),
      child: ListTile(
          shape: RoundedRectangleBorder(
              borderRadius: PageBorderRadius.allMedium()),
          tileColor: context.colorScheme.surface.withOpacity(0.2),
          onTap: () => context.push(RouterKeys.SECTION_ITEMS.route),
          title: Text("Pizza"),
          subtitle: Card(
              color: context.colorScheme.primary,
              child: Center(
                  child: Padding(
                padding: PagePadding.verticalMin(),
                child: Text(
                  "TRY 264",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ))),
          leading: UserCircleAvatar(
              backgroundImage: NetworkImage("https://picsum.photos/1920/1080")),
          trailing: PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                onTap: () => context.push(RouterKeys.CREATE_ITEM.route),
                child: Text("Edit"),
              ),
              PopupMenuItem(
                value: 1,
                onTap: () => provider.removeSectionItem(index),
                child: Text("Delete"),
              ),
            ],
          )),
    );
  }
}
