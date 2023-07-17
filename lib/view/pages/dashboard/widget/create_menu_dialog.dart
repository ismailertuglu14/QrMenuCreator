import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/product/widget/templates/celadon_menu_style.dart';

import '../../../../core/constans/enum/image_keys.dart';
import '../../../../core/constans/enum/lottie_keys.dart';
import '../../../../core/constans/enum/template_keys.dart';
import '../../../../core/init/provider/dashboard_provider.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/grid_delegates.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/elevation_button.dart';
import '../../../../product/widget/text_field.dart';
import '../../category/model/get_category_response_model.dart';
import '../../products/model/get_products_by_category_id_response_model.dart';
import '../../templates/model/base_template_model.dart';
import '../../templates/widget/template_list.dart';

class CreateMenuDialog extends StatelessWidget {
  const CreateMenuDialog({super.key, required this.createMenu});

  final Future<void> Function() createMenu;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: PagePadding.allMedium(),
        child: Consumer<DashboardProvider>(
          builder: (context, provider, child) =>
              Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: PagePadding.allMedium(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Create Menu",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: context.text.titleLarge?.fontSize),
                    textAlign: TextAlign.center,
                  ),
                  IconButton(
                      onPressed: () => context.pop(), icon: Icon(Icons.close)),
                ],
              ),
            ),
            CommonTextField(
              hintText: "Menu Name",
              textController: provider.menuNameController,
            ),
            SizedBox(
              height: context.height / 8,
              child: GridView.builder(
                itemCount: TemplateKeys.values.length,
                padding: PagePadding.allDefault(),
                scrollDirection: Axis.horizontal,
                gridDelegate: PageGridDelegates.medium(),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () =>
                      provider.changeTemplate(TemplateKeys.values[index]),
                  child: Container(
                    decoration: BoxDecoration(
                        color: context.colorScheme.surface.withOpacity(0.05),
                        borderRadius: PageBorderRadius.allMedium(),
                        border: Border.all(
                          color: provider.selectedTemplateKey ==
                                  TemplateKeys.values[index]
                              ? context.colorScheme.primary
                              : Colors.transparent,
                          width: 2,
                        )),
                    clipBehavior: Clip.antiAlias,
                    child:
                        templateList()[index].imageAsset(fit: BoxFit.fitWidth),
                  ),
                ),
              ),
            ),
            Padding(
              padding: PagePadding.verticalMedium(),
              child: Row(
                children: [
                  Consumer<DashboardProvider>(
                    builder: (context, provider, child) => provider.isLoading
                        ? LottieKeys.loading.path(
                            width: context.width / 4,
                            height: context.height / 15)
                        : Expanded(
                            child: CommonElevationButton(
                                child: Padding(
                                  padding: PagePadding.allMedium(),
                                  child: Text("Create"),
                                ),
                                onPressed: () {
                                  createMenu();
                                  provider.menuNameController.text.isNotEmpty
                                      ? context.pop()
                                      : null;
                                }),
                          ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
