import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';

import '../../../../core/constans/enum/image_keys.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/user_circle_avatar.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserCircleAvatar(
                backgroundImage: ImageKeys.default_cover.assetImage()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome Back",
                  style: context.text.headlineSmall,
                ),
                Text(
                  "Ercan Burger",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: context.text.titleLarge?.fontSize),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: PagePadding.horizontalMedium(),
          child: Text(
            "Here you can manage your bussniess.Tap on the bussniess name to start adding sections and items to your menu",
            style: TextStyle(fontSize: context.text.titleMedium?.fontSize),
          ),
        )
      ],
    );
  }
}
