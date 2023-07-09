// ignore_for_file: unnecessary_null_comparison, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:qrmenu/core/constans/cache/locale_keys_enum.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/init/cache/local_storage.dart';

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
      bottom: PreferredSize(
          preferredSize: Size(context.width, context.height / 10),
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
      toolbarHeight: context.height / 10,
      automaticallyImplyLeading: false,
      centerTitle: true,
      floating: true,
      snap: true,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
          titlePadding: PagePadding.allHeight(),
          centerTitle: true,
          expandedTitleScale: 1,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text.rich(
                textScaleFactor: 1,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                TextSpan(children: [
                  TextSpan(
                      text: " Welcome back  ",
                      style: TextStyle(
                          color: context.colorScheme.surface,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: (LocaleStorage.instance.getStringValue(
                                      LocaleKeys.BUSINESS_NAME) ==
                                  null ||
                              LocaleStorage.instance
                                  .getStringValue(LocaleKeys.BUSINESS_NAME)
                                  .isEmpty)
                          ? "Business Name"
                          : LocaleStorage.instance
                              .getStringValue(LocaleKeys.BUSINESS_NAME),
                      style: TextStyle(
                          color: context.colorScheme.primary,
                          fontWeight: FontWeight.bold)),
                ])),
          )),
    );
  }
}
