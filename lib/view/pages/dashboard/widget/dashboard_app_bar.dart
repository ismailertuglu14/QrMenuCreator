import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';

import '../../../../core/constans/enum/image_keys.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/text_field.dart';
import '../../../../product/widget/user_circle_avatar.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: context.colorScheme.onSecondary,
      title: Wrap(
        children: [
          UserCircleAvatar(
              maxRadius: 30,
              backgroundImage: ImageKeys.default_image.assetImage()),
          Padding(
            padding: PagePadding.horizontalHeight(),
            child: Column(
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
          ),
        ],
      ),
      toolbarHeight: context.height / 8,
      automaticallyImplyLeading: false,
      centerTitle: true,
      floating: true,
      snap: true,
      stretch: true,
      pinned: true,
      bottom: PreferredSize(
          preferredSize: Size(context.width, context.height / 15),
          child: Padding(
            padding: PagePadding.horizontalMedium(),
            child: CommonTextField(
              hintText: "Search Menu",
              hideInputDecoration: true,
              suffixIcon: Icon(Icons.filter_list),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              prefixIcon: Icon(Icons.search),
            ),
          )),
    );
  }
}
