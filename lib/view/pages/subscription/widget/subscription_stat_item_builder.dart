import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/product/utility/border_radius.dart';

import '../../../../product/utility/page_padding.dart';

class SubscriptonStatItemBuilder extends StatelessWidget {
  const SubscriptonStatItemBuilder({
    super.key,
    required this.maxMenuCount,
    required this.color,
    required this.title,
    required this.currentMenuCount,
  });
  final int maxMenuCount;
  final int currentMenuCount;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: PagePadding.allDefault(),
        child: Column(children: [
          Flexible(
            flex: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  "$currentMenuCount / $maxMenuCount",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.surface.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          Flexible(
              flex: 2,
              child: ClipRRect(
                borderRadius: PageBorderRadius.allMedium(),
                child: LinearProgressIndicator(
                  color: currentMenuCount == maxMenuCount
                      ? context.colorScheme.error
                      : color,
                  backgroundColor: context.colorScheme.surface.withOpacity(0.5),
                  value: currentMenuCount / maxMenuCount,
                ),
              )),
        ]),
      ),
    );
  }
}
