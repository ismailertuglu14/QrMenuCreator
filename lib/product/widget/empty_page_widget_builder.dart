import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';

import '../../core/constans/enum/image_keys.dart';
import '../utility/page_padding.dart';

emptyPageWidgetBuilder(BuildContext context, ImageKeys image, String text) {
  return Center(
    child: SizedBox(
      height: context.height / 2,
      width: context.width / 1.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Padding(
              padding: const PagePadding.allLow(),
              child: ImageKeys.values[image.index].imageAsset(
                  height: context.height / 5, width: context.width / 2),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const PagePadding.allLow(),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
