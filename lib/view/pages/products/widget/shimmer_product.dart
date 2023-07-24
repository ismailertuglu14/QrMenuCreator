import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';

Widget getProductShimmer(BuildContext context) {
  return Card(
    key: UniqueKey(),
    color: context.colorScheme.surface.withOpacity(0.1),
    child: Padding(
      padding: PagePadding.allDefault(),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListTile(
            contentPadding: PagePadding.allMedium(),
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: 30,
            ),
            title: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: 20,
              width: 50,
            ),
            subtitle: Padding(
              padding: PagePadding.verticalMin(),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: PageBorderRadius.allMedium(),
                    color: context.colorScheme.primary,
                  ),
                  constraints: BoxConstraints(maxHeight: context.height * 0.03),
                  child: Center(
                      child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    height: 10,
                    width: 100,
                  ))),
            ),
            trailing: PopupMenuButton(
              itemBuilder: (context) => [],
            )),
      ),
    ),
  );
}
