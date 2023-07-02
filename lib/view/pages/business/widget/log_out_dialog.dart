import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/core/init/provider/login_provider.dart';

import '../../../../core/constans/enum/route_keys.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/elevation_button.dart';

Future<dynamic> logOutDialog(
    BuildContext context, LoginProvider loginProvider) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            actions: [
              Row(
                children: [
                  Expanded(
                    child: CommonElevationButton(
                        onPressed: () => context.pop(), child: Text("No")),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          loginProvider.logout();
                          context.go(RouterKeys.LOGIN.route);
                        },
                        child: Text("Yes")),
                  ),
                ],
              ),
            ],
            content: Text("Are you sure to logout?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.text.titleMedium?.fontSize)),
          ));
}
