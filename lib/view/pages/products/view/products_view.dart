import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/core/constans/enum/lottie_keys.dart';
import 'package:qrmenu/core/constans/enum/route_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/image_icon_extenison.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/core/init/provider/products_provider.dart';
import 'package:qrmenu/product/widget/app_bar.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';
import 'package:qrmenu/product/widget/empty_page_widget_builder.dart';
import 'package:qrmenu/product/widget/user_circle_avatar.dart';
import 'package:qrmenu/view/pages/createproduct/model/create_product_response_model.dart';

import '../../../../core/init/network/network_manager.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/bottom_sheet_button.dart';
import '../../category/model/get_category_request_model.dart';
import '../model/delete_product_request_model.dart';
import '../model/delete_product_response_model.dart';
import '../model/get_products_by_category_id_request_model.dart';
import '../model/get_products_by_category_id_response_model.dart';
import '../service/Product_service.dart';
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
      appBar: CommonAppBar(
        title: Text(widget.title ?? "Section Items"),
      ),
      body: Consumer<ProductsProvider>(
        builder: (context, provider, child) => provider.productList == null
            ? Center(child: LottieKeys.loading.path(width: context.width / 4))
            : provider.productList!.isEmpty
                ? emptyPageWidgetBuilder(
                    context, ImageKeys.empty_category, "Not found any item")
                : RefreshIndicator(
                    onRefresh: () => getProductsByMenuId(),
                    child: Scrollbar(
                      child: ReorderableListView.builder(
                        itemCount: provider.productList!.length,
                        header: Padding(
                          padding: PagePadding.allDefault(),
                          child: Text("Add items in category",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      context.text.titleMedium?.fontSize)),
                        ),
                        padding: PagePadding.allHeight(),
                        itemBuilder: (context, index) => ProductItemCard(
                          category: provider.productList![index],
                          deleteProduct: deleteProduct,
                          key: ValueKey(index),
                    
                          categoryId: widget.categoryId,
                          menuId: widget.menuId,
                        ),
                        onReorder: (oldIndex, newIndex) {
                          if (oldIndex < newIndex) {
                            newIndex -= 1;
                          }
                          final item = provider.productList?.removeAt(oldIndex);
                          provider.productList?.insert(newIndex, item!);
                        },
                      ),
                    ),
                  ),
      ),
    );
  }
}
