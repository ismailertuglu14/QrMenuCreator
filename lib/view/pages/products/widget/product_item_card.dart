import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/core/constans/enum/lottie_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/image_icon_extenison.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/core/init/provider/products_provider.dart';

import '../../../../core/constans/enum/route_keys.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/user_circle_avatar.dart';
import '../model/get_products_by_category_id_response_model.dart';

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({
    super.key,
    this.categoryId,
    this.menuId,
    required this.deleteProduct,
    required this.category,
  });

  final GetProductsByMenuIdData category;
  final String? categoryId;
  final String? menuId;
  final Future<void> Function() deleteProduct;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.allDefault(),
      child: Consumer<ProductsProvider>(
        builder: (context, provider, child) => provider.productList == null
            ? LottieKeys.loading.path()
            : ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: PageBorderRadius.allMedium()),
                tileColor: context.colorScheme.surface.withOpacity(0.05),
                /* onTap: () => context.pushNamed(RouterKeys.CREATE_PRODUCT.name,
                    queryParams: {"categoryId": categoryId, "menuId": menuId}),*/
                title: Text(category.name),
                subtitle: Container(
                    decoration: BoxDecoration(
                      borderRadius: PageBorderRadius.allMedium(),
                      color: context.colorScheme.primary,
                    ),
                    constraints:
                        BoxConstraints(maxHeight: context.height * 0.03),
                    child: Center(
                        child: Padding(
                      padding: PagePadding.verticalMin(),
                      child: Text(
                        "${category.price} TL",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ))),
                leading: UserCircleAvatar(
                    backgroundImage: category.images.first.isEmpty
                        ? ImageKeys.default_image.assetImage()
                        : NetworkImage(category.images.first) as ImageProvider),
                trailing: PopupMenuButton(
                  onOpened: () => provider.setSelectedProductId = category.id,
                  onCanceled: () => provider.setSelectedProductId = null,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                        value: 0,
                        onTap: () =>
                            context.push(RouterKeys.CREATE_PRODUCT.route),
                        child: ListTile(
                          leading: ImageKeys.edit
                              .imageIcon(color: context.colorScheme.surface),
                          title: Text("Edit"),
                        )),
                    PopupMenuItem(
                      value: 1,
                      onTap: () => deleteProduct(),
                      child: ListTile(
                        textColor: context.colorScheme.error,
                        leading: ImageKeys.delete
                            .imageIcon(color: context.colorScheme.error),
                        title: Text("Delete"),
                      ),
                    ),
                  ],
                )),
      ),
    );
  }
}
