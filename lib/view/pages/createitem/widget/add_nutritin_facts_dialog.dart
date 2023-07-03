import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/init/provider/create_item_provider.dart';
import 'package:qrmenu/product/widget/text_field.dart';

import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/elevation_button.dart';
import 'nutrition_facts_check_box_builder.dart';

late final TextEditingController _fibreController;
Future<dynamic> addNutritionFactsDialog(
  BuildContext context,
) {
  return showDialog(
      context: context,
      builder: (context) => Dialog(
            child: Padding(
              padding: PagePadding.allMedium(),
              child: Wrap(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nutrition Facts",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: context.text.headlineSmall?.fontSize),
                    ),
                    IconButton(
                        onPressed: () => context.pop(), icon: Icon(Icons.close))
                  ],
                ),
                Text(
                    "Check only if you want to show dietary info with your item"),
                Consumer<CreateItemProvider>(
                  builder: (context, provider, child) => Column(children: [
                    NutritionFactsCheckBoxBuilder(
                      title: "Protein",
                      value: provider.kcalCalculate,
                      enabled: provider.kcalCalculate,
                      onChangedField: (value) =>
                          provider.changeProtein(double.parse(value)),
                      onTapField: () => provider.changeKcalCalculate(true),
                      onChanged: (value) =>
                          provider.changeKcalCalculate(value!),
                    ),
                    NutritionFactsCheckBoxBuilder(
                      title: "Carbs",
                      enabled: provider.kcalCalculate,
                      onChangedField: (value) =>
                          provider.changeCarbohydrate(double.parse(value)),
                      onTapField: () => provider.changeKcalCalculate(true),
                      value: provider.kcalCalculate,
                      onChanged: (value) =>
                          provider.changeKcalCalculate(value!),
                    ),
                    NutritionFactsCheckBoxBuilder(
                      title: "Fats",
                      onChangedField: (value) =>
                          provider.changeFat(double.parse(value)),
                      onTapField: () => provider.changeKcalCalculate(true),
                      value: provider.kcalCalculate,
                      enabled: provider.kcalCalculate,
                      onChanged: (value) =>
                          provider.changeKcalCalculate(value!),
                    ),
                    NutritionFactsCheckBoxBuilder(
                      title: "Fibre",
                      value: false,
                      onChanged: (value) {},
                    ),
                    Padding(
                      padding: PagePadding.allMedium(),
                      child: Consumer<CreateItemProvider>(
                        builder: (context, provider, child) => Text(
                          "Calories(KCal): ${provider.calculateCalories()}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: context.text.titleLarge?.fontSize),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CommonElevationButton(
                            child: Padding(
                              padding: PagePadding.allMedium(),
                              child: Text("Save"),
                            ),
                            onPressed: () => context.pop(),
                          ),
                        ),
                      ],
                    )
                  ]),
                ),
              ]),
            ),
          ));
}
