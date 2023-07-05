import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/enum/lottie_keys.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/core/init/provider/products_provider.dart';

import '../../../../core/constans/enum/route_keys.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/user_circle_avatar.dart';

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({
    super.key,
    required this.index,
    this.categoryId,
    this.menuId,
  });

  final int index;
  final String? categoryId;
  final String? menuId;
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
                tileColor: context.colorScheme.surface.withOpacity(0.2),
                onTap: () => context.pushNamed(RouterKeys.CREATE_PRODUCT.name,
                    queryParams: {"categoryId": categoryId, "menuId": menuId}),
                title:
                    Text(provider.productList?[index].name ?? "Product Name"),
                subtitle: Card(
                    color: context.colorScheme.primary,
                    child: Center(
                        child: Padding(
                      padding: PagePadding.verticalMin(),
                      child: Text(
                        "${provider.productList![index].price} TL",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ))),
                leading: UserCircleAvatar(
                    backgroundImage:
                        NetworkImage("https://picsum.photos/1920/1080")),
                trailing: PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 0,
                      onTap: () =>
                          context.push(RouterKeys.CREATE_PRODUCT.route),
                      child: Text("Edit"),
                    ),
                    PopupMenuItem(
                      value: 1,
                      onTap: () => provider.removeProductItem(index),
                      child: Text("Delete"),
                    ),
                  ],
                )),
      ),
    );
  }
}
