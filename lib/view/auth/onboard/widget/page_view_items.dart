import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';

import '../../../../product/utility/page_padding.dart';
import '../model/onboard_model.dart';

class PageViewItems extends StatelessWidget {
  const PageViewItems({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.allHeight(),
      child: Column(
        children: [
          Expanded(
              flex: 8,
              child: Padding(
                padding: const PagePadding.spesificAuth(),
                child: OnboardModels.items[index].imagePath.assetImage(),
              )),
          Expanded(
              flex: 1,
              child: Padding(
                  padding: const PagePadding.horizontalHeight(),
                  child: Text(OnboardModels.items[index].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: context.text.headlineSmall!.fontSize,
                          color: context.colorScheme.surface)))),
          Expanded(
              flex: 2,
              child: Padding(
                  padding: const PagePadding.horizontalHeight(),
                  child: Text(OnboardModels.items[index].description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: context.text.titleMedium!.fontSize,
                          color: Theme.of(context)
                              .colorScheme
                              .surface
                              .withOpacity(0.5)))))
        ],
      ),
    );
  }
}
