import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/product/utility/border_radius.dart';
import 'package:qrmenu/product/utility/durations.dart';
import 'package:qrmenu/product/utility/grid_delegates.dart';
import 'package:qrmenu/product/widget/app_bar.dart';

import '../../../../core/init/provider/templates_provider.dart';
import '../widget/templates_bottom_sheet.dart';

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
      bottomSheet: Consumer<TemplatesProvider>(
        builder: (context, provider, child) => BottomSheet(
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
            builder: (context) => TemplatesBottomSheet()),
      ),
    );
  }
}
