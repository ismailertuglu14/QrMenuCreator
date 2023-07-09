// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/enum/route_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/image_icon_extenison.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/core/init/provider/edit_business_provider.dart';

import '../../../../core/constans/cache/locale_keys_enum.dart';
import '../../../../core/constans/enum/image_keys.dart';
import '../../../../core/constans/enum/theme_mode_keys.dart';
import '../../../../core/init/cache/local_storage.dart';
import '../../../../core/init/provider/theme_provider.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/user_circle_avatar.dart';

class BusinessHeader extends StatelessWidget {
  const BusinessHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Consumer<EditBusinessProvider>(
            builder: (context, value, child) => UserCircleAvatar(
              maxRadius: 40,
              backgroundImage: (LocaleStorage.instance
                              .getStringValue(LocaleKeys.COVER_IMAGE) ==
                          null ||
                      LocaleStorage.instance
                          .getStringValue(LocaleKeys.COVER_IMAGE)
                          .isEmpty)
                  ? ImageKeys.default_image.assetImage()
                  : NetworkImage(LocaleStorage.instance
                      .getStringValue(LocaleKeys.COVER_IMAGE)) as ImageProvider,
            ),
          ),
          Padding(
            padding: PagePadding.allMedium(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  (LocaleStorage.instance
                                  .getStringValue(LocaleKeys.BUSINESS_NAME) ==
                              null ||
                          LocaleStorage.instance
                              .getStringValue(LocaleKeys.BUSINESS_NAME)
                              .isEmpty)
                      ? "Business Name"
                      : LocaleStorage.instance
                          .getStringValue(LocaleKeys.BUSINESS_NAME),
                  style: TextStyle(
                      fontSize: context.text.headlineSmall?.fontSize,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  (LocaleStorage.instance
                                  .getStringValue(LocaleKeys.BUSINESS_NAME) ==
                              null ||
                          LocaleStorage.instance
                              .getStringValue(LocaleKeys.BUSINESS_NAME)
                              .isEmpty)
                      ? "businessname@gmail.com"
                      : LocaleStorage.instance
                          .getStringValue(LocaleKeys.BUSINESS_NAME),
                  style:
                      TextStyle(fontSize: context.text.titleMedium?.fontSize),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () => context.push(RouterKeys.EDIT_BUSINESS.route),
              icon: ImageKeys.edit_business
                  .imageIcon(color: context.colorScheme.surface))
        ],
      ),
    );
  }
}
