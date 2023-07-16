import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/init/provider/templates_provider.dart';
import 'package:qrmenu/product/utility/border_radius.dart';

import '../../../../core/constans/enum/template_keys.dart';
import '../../../../product/utility/grid_delegates.dart';
import '../../../../product/utility/page_padding.dart';

class SelectTemplateBottomSheet extends StatelessWidget {
  const SelectTemplateBottomSheet({
    super.key,
    required AnimationController animationController,
    required this.changeTemplate,
  }) : _animationController = animationController;

  final AnimationController _animationController;
  final Future<void> Function() changeTemplate;
  @override
  Widget build(BuildContext context) {
    return Consumer<TemplatesProvider>(
      builder: (context, provider, child) => BottomSheet(
          animationController: _animationController,
          backgroundColor: context.colorScheme.surface.withOpacity(0.05),
          shadowColor: Colors.black,
          onDragStart: (details) => provider.toggleBottomSheet(),
          showDragHandle: true,
          constraints: BoxConstraints.expand(
              height:
                  context.height * (provider.isBottomSheetOpen ? 0.25 : 0.05),
              width: context.width),
          onClosing: () {},
          builder: (context) => Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Consumer<TemplatesProvider>(
                      builder: (context, provider, child) => DropdownButton(
                        underline: Container(),
                        borderRadius: PageBorderRadius.allMedium(),
                        value: provider.selectedMenuId,
                        padding: PagePadding.horizontalLow(),
                        hint: Text("Select Menu"),
                        icon: Icon(Icons.arrow_drop_down_rounded),
                        isExpanded: true,
                        items: List.generate(
                            provider.menus?.length ?? 0,
                            (index) => DropdownMenuItem(
                                  value: provider.menus?[index].id,
                                  child: Row(
                                    children: [
                                      Text(provider.menus![index].name
                                          .toUpperCase()),
                                      Spacer(),
                                      Text(
                                          "${provider.menus?[index].productCount ?? 0} Products"),
                                    ],
                                  ),
                                )),
                        onChanged: (value) {
                          provider.changeMenuId(value);
                          changeTemplate();
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: GridView.builder(
                      itemCount: TemplateKeys.values.length,
                      padding: PagePadding.allDefault(),
                      scrollDirection: Axis.horizontal,
                      gridDelegate: PageGridDelegates.medium(),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => provider
                            .changeTemplateKey(TemplateKeys.values[index]),
                        child: Container(
                          decoration: BoxDecoration(
                              color:
                                  context.colorScheme.surface.withOpacity(0.05),
                              borderRadius: PageBorderRadius.allMedium(),
                              border: Border.all(
                                color: provider.selectedTemplateKey ==
                                        TemplateKeys.values[index]
                                    ? context.colorScheme.primary
                                    : Colors.transparent,
                                width: 2,
                              )),
                          clipBehavior: Clip.antiAlias,
                          child: Banner(
                            color: context.colorScheme.primary,
                            location: BannerLocation.topEnd,
                            message: "PRO",
                            child: ImageKeys.celadon
                                .imageAsset(fit: BoxFit.fitWidth),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
    );
  }
}
