import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/context_extension.dart';

import '../../../../core/init/provider/create_item_provider.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/grid_delegates.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/elevation_button.dart';
import '../model/allergens_model.dart';

Future<dynamic> addAllergensDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) => Consumer<CreateItemProvider>(
            builder: (context, provider, child) => Dialog(
              child: Padding(
                padding: PagePadding.allMedium(),
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
                      itemCount: provider.suggestionAllergens.length,
                      padding: PagePadding.allHeight(),
                      gridDelegate: PageGridDelegates.ultra(),
                      itemBuilder: (context, index) => Container(
                          width: context.width * 0.2,
                          height: context.height * 0.1,
                          decoration: BoxDecoration(
                              borderRadius: PageBorderRadius.allMedium(),
                              color: context.colorScheme.primary),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(provider.suggestionAllergens[index].icon),
                              Text(provider.suggestionAllergens[index].name)
                            ],
                          ))),
                  Padding(
                    padding: PagePadding.allMin(),
                    child: Row(
                      children: [
                        Expanded(
                          child: CommonElevationButton(
                            child: Padding(
                              padding: PagePadding.allMedium(),
                              child: Text("Add"),
                            ),
                            onPressed: () {
                              provider.addAllergens(AllergensModel(
                                  "name", Icons.fastfood_outlined));
                              context.pop();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ));
}
