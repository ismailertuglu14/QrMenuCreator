import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/enum/route_keys.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/core/init/provider/products_provider.dart';
import 'package:qrmenu/product/widget/app_bar.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';
import 'package:qrmenu/product/widget/user_circle_avatar.dart';

import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/bottom_sheet_button.dart';
import '../widget/product_item_card.dart';
part '../viewmodel/products_view_model.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key, this.title, this.categoryId, this.menuId});
  final String? title;
  final String? categoryId;
  final String? menuId;
  @override
  State<ProductsView> createState() => _ProductsViewViewState();
}

class _ProductsViewViewState extends ProductsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomSheetButton(
        child: Text("Add Prodcut Item"),
        onPressed: () => context.pushNamed(RouterKeys.CREATE_PRODUCT.name,
            queryParams: {
              "categoryId": widget.categoryId,
              "menuId": widget.menuId
            }),
      ),
      appBar: CommonAppBar(title: Text(widget.title ?? "Section Items")),
      body: Consumer<ProductsProvider>(
        builder: (context, provider, child) => ReorderableListView.builder(
          itemCount: provider.productList.length,
          header: Padding(
            padding: PagePadding.allDefault(),
            child: Text("Add items in sections",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.text.titleMedium?.fontSize)),
          ),
          padding: PagePadding.allHeight(),
          itemBuilder: (context, index) =>
              ProductItemCard(key: ValueKey(index), index: index,categoryId: widget.categoryId,menuId: widget.menuId,),
          onReorder: (oldIndex, newIndex) {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final item = provider.productList.removeAt(oldIndex);
            provider.productList.insert(newIndex, item);
          },
        ),
      ),
    );
  }
}
