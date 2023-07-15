import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/product/utility/border_radius.dart';
import 'package:qrmenu/product/utility/durations.dart';
import 'package:qrmenu/product/utility/grid_delegates.dart';
import 'package:qrmenu/product/widget/app_bar.dart';
import 'package:qrmenu/view/pages/category/model/get_category_response_model.dart';
import 'package:qrmenu/view/pages/products/model/get_products_by_category_id_response_model.dart';
import 'package:qrmenu/view/pages/templates/model/base_template_model.dart';

import '../../../../core/init/provider/templates_provider.dart';
import '../../../../product/widget/templates/celadon_menu_style.dart';
import '../widget/select_template_bottom_sheet.dart';


part '../viewmodel/templates_view_model.dart';

class TemplatesView extends StatefulWidget {
  const TemplatesView({super.key});

  @override
  State<TemplatesView> createState() => _TemplatesViewState();
}

class _TemplatesViewState extends TemplatesViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet:
          SelectTemplateBottomSheet(animationController: _animationController),
      body: CeladonMenuStyle(
          model: BaseTemplateModel(
              List.generate(
                  25,
                  (index) => GetCategoriesData(
                      id: "id",
                      name: "Salatalar",
                      image: "https://picsum.photos/1920/1080",
                      productCount: 12)),
              List.generate(
                  25,
                  (index) => GetProductsByMenuIdData(
                      id: "id",
                      name: "Taquitos",
                      description:
                          "descriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescription",
                      price: 256,
                      currency: "currency",
                      images: ["https://picsum.photos/1920/1080"])))),
    );
  }
}
