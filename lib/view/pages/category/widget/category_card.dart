import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/core/constans/enum/route_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/product/utility/border_radius.dart';
import 'package:qrmenu/product/widget/user_circle_avatar.dart';

import '../../../../core/init/provider/category_provider.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/item_count_circle.dart';
import '../model/create_category_response_model.dart';
import '../model/get_category_response_model.dart';
import 'add_category_dialog.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.index,
    required this.category,
    required this.menuId,
    required this.deleteCategory,
  });

  final int index;
  final String menuId;
  final GetCategoriesData category;
  final Future<void> Function() deleteCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.allDefault(),
      child: Consumer<CategoryProvider>(
        builder: (context, provider, child) => ListTile(
          onTap: () =>
              context.pushNamed(RouterKeys.PRODUCTS.name, queryParams: {
            "title": category.name,
            "categoryId": category.id,
            "menuId": menuId,
          }),
          contentPadding: PagePadding.allDefault(),
          tileColor: context.colorScheme.surface.withOpacity(0.05),
          title: Text(category.name),
          leading: UserCircleAvatar(
              backgroundImage: ImageKeys.default_image.assetImage()),
          trailing: SizedBox(
            width: context.width * 0.3,
            child: Row(
              children: [
                Expanded(
                    flex: 8,
                    child: ItemCountCircle(count: category.productCount)),
                Expanded(
                  flex: 2,
                  child: PopupMenuButton(
                    onOpened: () => provider.setSelectedCategoryId(category.id),
                    onCanceled: () => provider.setSelectedCategoryId(null),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        onTap: () {},
                        child: Text("Edit"),
                      ),
                      PopupMenuItem(
                        onTap: () => deleteCategory(),
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
      ),
    );
  }
}
