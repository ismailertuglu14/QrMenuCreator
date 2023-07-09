import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';

Widget getCategoryShimmer(BuildContext context, int index) {
  return Card(
    color: context.colorScheme.surface.withOpacity(0.1),
    key: ValueKey(index),
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
                borderRadius: PageBorderRadius.allMedium(),
              ),
              height: 20,
              width: 100,
            ),
            trailing: SizedBox(
              width: context.width * 0.3,
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      maxRadius: 15,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: PopupMenuButton(
                        color: Colors.grey[300], itemBuilder: (context) => []),
                  ),
                ],
              ),
            )),
      ),
    ),
  );
}
