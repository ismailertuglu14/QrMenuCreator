import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/init/provider/templates_provider.dart';
import 'package:qrmenu/product/utility/grid_delegates.dart';
import 'package:qrmenu/product/utility/page_padding.dart';

import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/durations.dart';

class TemplatesItemBuilder extends StatelessWidget {
  const TemplatesItemBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 10,
      padding: PagePadding.allDefault(),
      scrollDirection: Axis.horizontal,
      gridDelegate: PageGridDelegates.height(),
      itemBuilder: (context, index) => Card(
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
    );
  }
}
