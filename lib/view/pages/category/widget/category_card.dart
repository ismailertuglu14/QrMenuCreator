import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/core/constans/enum/route_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/product/utility/border_radius.dart';

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
  });

  final int index;
  final GetCategoriesData category;

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
          }),
          tileColor: context.colorScheme.secondary.withOpacity(0.1),
          title: Text(category.name),
          leading: Padding(
            padding: PagePadding.allMin(),
            child: ClipRRect(
                borderRadius: PageBorderRadius.allMedium(),
                child: ImageKeys.default_banner.imageAsset()),
          ),
          trailing: SizedBox(
            width: context.width * 0.3,
            child: Row(
              children: [
                Expanded(flex: 8, child: ItemCountCircle(count: 5)),
                Expanded(
                  flex: 2,
                  child: PopupMenuButton(
                    itemBuilder: (context) => [
                      /* PopupMenuItem(
                        value: 1,
                        onTap: () {
                          Future.microtask(() => 
                              provider
                              .categoryController.text = provider.categorySuggestionList[index]);
      
                          Future.sync(() => addCategoryDialog(context, , sectionSuggestionList, provider, createCategory: createCategory, uploadFile: uploadFile));
                        },
                        child: Text("Edit"),
                      ),
                      PopupMenuItem(
                        onTap: () => provider.removeSection(index),
                        value: 2,
                        child: Text("Delete"),
                      ),*/
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
