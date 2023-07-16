import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/core/constans/enum/lottie_keys.dart';
import 'package:qrmenu/core/constans/enum/route_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/image_icon_extenison.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/product/utility/border_radius.dart';
import 'package:qrmenu/product/utility/page_padding.dart';
import 'package:qrmenu/product/widget/app_bar.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';
import 'package:qrmenu/product/widget/empty_page_widget_builder.dart';
import 'package:qrmenu/product/widget/text_field.dart';
import 'package:qrmenu/view/pages/category/model/relocate_category_request_model.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/init/network/network_manager.dart';
import '../../../../core/init/provider/category_provider.dart';
import '../../../../product/widget/item_count_circle.dart';
import '../../dashboard/model/delete_menu_request_model.dart';
import '../model/create_category_response_model.dart';
import '../model/delete_category_request_model.dart';
import '../model/delete_category_response_model.dart';
import '../model/get_category_request_model.dart';
import '../model/get_category_response_model.dart';
import '../model/relocate_category_response_model.dart';
import '../service/Category_service.dart';
import '../widget/add_category_button.dart';
import '../widget/category_card.dart';
import '../widget/category_shimmer.dart';
part '../viewmodel/category_view_model.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key, this.id, this.name}) : super(key: key);
  final String? id;
  final String? name;
  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends CategoryViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AddSectionButton(
          sectionSuggestionList: _categoryProvider.categorySuggestionList,
          createCategory: createCategory,
          imagePicker: _picker,
          uploadFile: uploadFile),
      appBar: CommonAppBar(
        title: Text(widget.name ?? "Menu"),
      ),
      body: Consumer<CategoryProvider>(
        builder: (context, provider, child) => provider.categoryList!.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageKeys.empty_category
                        .imageAsset(width: context.width * 0.3),
                    Padding(
                      padding: PagePadding.verticalHight(),
                      child: Text(
                        "Not found any category",
                        style: context.text.headlineSmall,
                      ),
                    )
                  ],
                ),
              )
            : RefreshIndicator(
                onRefresh: () => getCategories(),
                child: (provider.categoryList != null &&
                        provider.categoryList!.isEmpty)
                    ? emptyPageWidgetBuilder(context, ImageKeys.empty_category,
                        "Not found any category")
                    : Scrollbar(
                        child: ReorderableListView.builder(
                          padding: PagePadding.allHeight(),
                          itemCount: provider.categoryList?.length ?? 10,
                          header: Text("Add category in your menu",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      context.text.titleMedium?.fontSize)),
                          onReorderStart: (index) =>
                              provider.setSelectedCategoryId(
                                  provider.categoryList![index].id),
                          itemBuilder: (context, index) => (provider
                                          .categoryList ==
                                      null ||
                                  provider.isLoading)
                              ? getCategoryShimmer(context)
                              : CategoryCard(
                                  deleteCategory: deleteCategory,
                                  menuId: widget.id ?? "",
                                  category: provider.categoryList![index],
                                  key: ValueKey(provider.categoryList![index]),
                                  index: index),
                          onReorder: (oldIndex, newIndex) {
                            if (oldIndex < newIndex) {
                              newIndex -= 1;
                            }
                            relocateCategory(
                                categoryId: provider.selectedCategoryId ?? "",
                                newPosition: newIndex);
                            final item =
                                provider.categoryList!.removeAt(oldIndex);
                            provider.categoryList!.insert(newIndex, item);
                          },
                        ),
                      ),
              ),
      ),
    );
  }
}
