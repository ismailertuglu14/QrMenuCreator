import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  }) : _animationController = animationController;

  final AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return Consumer<TemplatesProvider>(
      builder: (context, provider, child) => BottomSheet(
          animationController: _animationController,
          backgroundColor: context.colorScheme.surface.withOpacity(0.05),
          shadowColor: Colors.black,
          enableDrag: true,
          onDragStart: (details) {
            provider.toggleBottomSheet();
          },
          onDragEnd: (details, {required isClosing}) {},
          showDragHandle: true,
          constraints: BoxConstraints.expand(
              height:
                  context.height * (provider.isBottomSheetOpen ? 0.25 : 0.05),
              width: context.width),
          onClosing: () {},
          builder: (context) => GridView.builder(
                itemCount: TemplateKeys.values.length,
                padding: PagePadding.allDefault(),
                scrollDirection: Axis.horizontal,
                gridDelegate: PageGridDelegates.medium(),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () =>
                      provider.changeTemplateKey(TemplateKeys.values[index]),
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
                    child: Banner(
                      color: context.colorScheme.primary,
                      location: BannerLocation.topEnd,
                      message: "PRO",
                      child: Image.network(
                        "https://picsum.photos/1920/1080",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}
