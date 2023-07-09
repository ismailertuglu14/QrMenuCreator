import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/core/init/provider/login_provider.dart';

import '../../../../core/constans/enum/route_keys.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/elevation_button.dart';
import '../../../../product/widget/outline_button.dart';

Future<dynamic> logOutDialog(
    BuildContext context, LoginProvider loginProvider) {
  return showDialog(
      context: context,
      builder: (context) => Dialog(
            child: Padding(
              padding: PagePadding.allMedium(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: PagePadding.allMedium(),
                    child:
                        ImageKeys.google.imageAsset(width: context.width * 0.1),
                  ),
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
                          child: CommonElevationButton(
                              onPressed: () {
                                loginProvider.logout();
                                context.go(RouterKeys.LOGIN.route);
                              },
                              child: Padding(
                                padding: PagePadding.allMedium(),
                                child: Text("Log Out"),
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ));
}
