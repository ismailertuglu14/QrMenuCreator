import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/cache/locale_keys_enum.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/core/init/cache/local_storage.dart';
import 'package:qrmenu/core/init/provider/login_provider.dart';

import '../../../../core/constans/enum/route_keys.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/elevation_button.dart';
import '../../../../product/widget/outline_button.dart';

Dialog logOutDialog(BuildContext context) {
  return Dialog(
    child: Padding(
      padding: PagePadding.allMedium(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: PagePadding.allMedium(),
              child: Icon(
                Icons.logout_rounded,
                size: context.width / 5,
              )),
          Padding(
            padding: PagePadding.allMedium(),
            child: Text("Are you sure\n you want to logout?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.text.titleMedium?.fontSize)),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: PagePadding.allDefault(),
                  child: CommonOutlineButton(
                      onPressed: () => context.pop(),
                      child: Padding(
                        padding: PagePadding.allMedium(),
                        child: Text("Cancel"),
                      )),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: PagePadding.allDefault(),
                  child: Consumer<LoginProvider>(
                    builder: (context, provider, child) =>
                        CommonElevationButton(
                            onPressed: () {
                              provider.logout();
                              context.go(RouterKeys.LOGIN.route);
                            },
                            child: Padding(
                              padding: PagePadding.allMedium(),
                              child: Text("Log Out"),
                            )),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
