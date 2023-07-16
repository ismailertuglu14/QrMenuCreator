import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/enum/lottie_keys.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/product/utility/border_radius.dart';
import 'package:qrmenu/product/utility/durations.dart';
import 'package:qrmenu/product/utility/grid_delegates.dart';
import 'package:qrmenu/product/widget/app_bar.dart';

import 'package:qrmenu/view/pages/category/model/get_category_request_model.dart';
import 'package:qrmenu/view/pages/category/model/get_category_response_model.dart';
import 'package:qrmenu/view/pages/category/service/Category_service.dart';
import 'package:qrmenu/view/pages/dashboard/service/Dashboard_service.dart';
import 'package:qrmenu/view/pages/products/model/get_products_by_category_id_request_model.dart';
import 'package:qrmenu/view/pages/products/model/get_products_by_category_id_response_model.dart';
import 'package:qrmenu/view/pages/products/service/Product_service.dart';
import 'package:qrmenu/view/pages/templates/model/base_template_model.dart';

import '../../../../core/init/network/network_manager.dart';
import '../../../../core/init/provider/templates_provider.dart';
import '../../../../product/widget/templates/celadon_menu_style.dart';
import '../../../../product/widget/templates/fulvous_menu_style.dart';
import '../../dashboard/model/get_restaurant_menus_response_model.dart';
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
      bottomSheet: SelectTemplateBottomSheet(
          changeTemplate: changeTemplate,
          animationController: _animationController),
      body: Consumer<TemplatesProvider>(
          builder: (context, provider, child) => provider.isLoading
              ? LottieKeys.loading.path()
              : _templates[provider.selectedTemplateKey.index]),
    );
  }
}
