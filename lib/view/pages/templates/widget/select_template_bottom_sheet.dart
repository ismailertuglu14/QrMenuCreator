import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/init/provider/templates_provider.dart';
import 'package:qrmenu/view/pages/templates/widget/templates_item_builder.dart';

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
                  context.height * (provider.isBottomSheetOpen ? 0.3 : 0.05),
              width: context.width),
          onClosing: () {},
          builder: (context) => TemplatesItemBuilder()),
    );
  }
}
