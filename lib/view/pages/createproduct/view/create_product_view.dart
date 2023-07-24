import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/cache/locale_keys_enum.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/core/constans/enum/lottie_keys.dart';
import 'package:qrmenu/core/constans/enum/route_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/core/init/cache/local_storage.dart';
import 'package:qrmenu/core/init/provider/add_ons_provider.dart';
import 'package:qrmenu/core/init/provider/create_product_provider.dart';
import 'package:qrmenu/product/utility/border_radius.dart';
import 'package:qrmenu/product/utility/box_decoration.dart';

import 'package:qrmenu/product/utility/grid_delegates.dart';
import 'package:qrmenu/product/widget/close_keyboard.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';
import 'package:qrmenu/product/widget/text_field.dart';
import 'package:qrmenu/product/widget/upload_file_dialog.dart';
import 'package:qrmenu/product/widget/user_circle_avatar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/constans/enum/upload_file_keys.dart';
import '../../../../core/init/network/network_manager.dart';
import '../../../../core/init/provider/products_provider.dart';
import '../../../../product/utility/durations.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/app_bar.dart';
import '../../../../product/widget/custom_switch_list_tile.dart';
import '../../category/model/get_category_response_model.dart';
import '../model/get_product_by_id_response_model.dart';
import '../../products/model/get_products_by_category_id_response_model.dart';
import '../../../../product/widget/item_count_circle.dart';
import '../model/create_product_response_model.dart';
import '../model/update_product_response_model.dart';
import '../service/CreateProduct_service.dart';
import '../widget/add_allergens_dialog.dart';
import '../widget/add_nutritin_facts_dialog.dart';

import '../widget/create_item_file_preview.dart';
import '../widget/create_item_list_tile_builder.dart';
import '../widget/create_item_switch_list_tile_builder.dart';
part '../viewmodel/create_product_view_model.dart';

class CreateProductView extends StatefulWidget {
  const CreateProductView(
      {Key? key, this.menuId, this.categoryId, this.productId})
      : super(key: key);
  final String? menuId;
  final String? categoryId;
  final String? productId;
  @override
  State<CreateProductView> createState() => _CreateProductViewViewState();
}

class _CreateProductViewViewState extends CreateProductViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          title: Text("Create Product"),
        ),
        body: CloseKeyboard(
          child: SingleChildScrollView(
              padding: PagePadding.allHeight(),
              child: SizedBox(
                height: context.height * 1.2,
                width: context.width,
                child: Column(children: [
                  Expanded(
                      flex: 20,
                      child: CreateItemPreviewFiles(
                          imagePicker: _imagePicker,
                          uploadObject: uploadObject)),
                  Expanded(
                    flex: 5,
                    child: Consumer<CreateProductProvider>(
                      builder: (context, provider, child) =>
                          AnimatedSmoothIndicator(
                              effect: WormEffect(
                                  dotHeight: 10,
                                  dotWidth: 10,
                                  activeDotColor: context.colorScheme.primary),
                              activeIndex: provider.itemImageCurentIndex,
                              count: provider.itemPreviewList.length + 1),
                    ),
                  ),
                  Expanded(
                    flex: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CommonTextField(
                          hintText: "Name",
                          textController: _nameController,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.done,
                        ),
                        CommonTextField(
                          hintText: "Description",
                          textController: _descriptionController,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.done,
                        ),
                        CreateItemListTileBuilder(
                          onTap: () => addNutritionFactsDialog(
                            context,
                            _proteinController,
                            _carbohydrateController,
                            _fatController,
                            _fibreController,
                          ),
                          trailing: Icon(Icons.add_circle_outline_rounded),
                          title: Row(children: [
                            Expanded(
                                child: Text(
                              "Nutrition Facts",
                              style: context.text.titleMedium,
                            )),
                            Expanded(
                                child: Consumer<CreateProductProvider>(
                              builder: (context, provider, child) => Text(
                                "${provider.calculateCalories()} KCal",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        context.text.titleMedium?.fontSize),
                              ),
                            )),
                          ]),
                        ),
                        CreateItemListTileBuilder(
                          onTap: () => context.push(RouterKeys.ADD_ONS.route),
                          trailing: Icon(Icons.add_circle_outline_rounded),
                          title: Row(
                            children: [
                              Text(
                                "Add-Ons",
                                style: context.text.titleMedium,
                              ),
                              Consumer<AddOnsProvider>(
                                  builder: (context, provider, child) =>
                                      ItemCountCircle(
                                          count: provider.onsPreviewList
                                              .where((item) => item.isSelected)
                                              .length)),
                            ],
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            height: context.height * 0.1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text("Allergens",
                                      style: context.text.titleMedium),
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Consumer<CreateProductProvider>(
                                    builder: (context, provider, child) =>
                                        GridView.builder(
                                      padding: PagePadding.allDefault(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: provider.allergens.length + 1,
                                      gridDelegate: PageGridDelegates.normal(),
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () =>
                                              index == provider.allergens.length
                                                  ? addAllergensDialog(context)
                                                  : null,
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: PageBorderRadius
                                                      .allMedium(),
                                                  color: index !=
                                                          provider
                                                              .allergens.length
                                                      ? context
                                                          .colorScheme.primary
                                                      : context
                                                          .colorScheme.surface
                                                          .withOpacity(0.2)),
                                              child: index !=
                                                      provider.allergens.length
                                                  ? provider
                                                      .allergensSuggesitonIcons[
                                                          index]
                                                      .imageAsset()
                                                  : Icon(Icons.edit_rounded)),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                "USD",
                                style: context.text.titleMedium,
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: CommonTextField(
                                textController: _priceController,
                                textAlign: TextAlign.center,
                                hintText: "Price",
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            )
                          ],
                        ),
                        Consumer<CreateProductProvider>(
                          builder: (context, provider, child) => ListTileSwitch(
                              value: provider.isActive,
                              contentPadding: EdgeInsets.zero,
                              switchActiveColor: context.colorScheme.primary,
                              title: Text("Active",
                                  style: context.text.titleMedium),
                              onChanged: provider.changeIsActive),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Consumer<CreateProductProvider>(
                                builder: (context, provider, child) =>
                                    provider.isLoading
                                        ? LottieKeys.loading.path(
                                            width: context.width * 0.1,
                                            height: context.width * 0.1)
                                        : CommonElevationButton(
                                            child: Padding(
                                              padding: PagePadding.allHeight(),
                                              child: Text("Save"),
                                            ),
                                            onPressed: () =>
                                                widget.productId != null
                                                    ? updateProduct()
                                                    : createProduct(),
                                          ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ]),
              )),
        ));
  }
}
