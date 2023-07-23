import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';

import '../../../../core/init/provider/create_product_provider.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/grid_delegates.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/elevation_button.dart';

Future<dynamic> addAllergensDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) => Consumer<CreateProductProvider>(
            builder: (context, provider, child) => Dialog(
              child: Padding(
                padding: PagePadding.allDefault(),
                child: Wrap(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Allergens",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: context.text.titleLarge?.fontSize),
                        textAlign: TextAlign.center,
                      ),
                      IconButton(
                          onPressed: () => context.pop(),
                          icon: Icon(Icons.close)),
                    ],
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      itemCount: provider.allergenSuggestions.length,
                      padding: PagePadding.allHeight(),
                      gridDelegate: PageGridDelegates.ultra(),
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              provider.changeAllergenState(index);
                              provider.allergenSuggestions[index].isAllergen
                                  ? provider.allergens.add(index)
                                  : provider.allergens.remove(index);
                            },
                            child: Container(
                                width: context.width * 0.2,
                                height: context.height * 0.1,
                                decoration: BoxDecoration(
                                    borderRadius: PageBorderRadius.allMedium(),
                                    color: provider.allergenSuggestions[index]
                                            .isAllergen
                                        ? context.colorScheme.primary
                                        : context.colorScheme.surface
                                            .withOpacity(0.1)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding: PagePadding.allMin(),
                                        child: provider
                                            .allergensSuggesitonIcons[index]
                                            .imageAsset(
                                                height: context.height * 0.1,
                                                width: context.width * 0.1),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Padding(
                                        padding: PagePadding.horizontalMin(),
                                        child: Text(provider
                                            .allergenSuggestions[index].name),
                                      ),
                                    )
                                  ],
                                )),
                          )),
                ]),
              ),
            ),
          ));
}
