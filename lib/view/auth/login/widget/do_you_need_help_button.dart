import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/router_extension.dart';

import '../../../../core/constans/enum/route_keys.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/elevation_button.dart';
import '../../../../product/widget/email_app_router.dart';

class DoYouNeedHelpButtons extends StatelessWidget {
  const DoYouNeedHelpButtons({
    super.key,
  });
  final String _forgetPassword = "Forget Password";
  final String _need = "Do you need help?";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: (context) => Padding(
                          padding: const PagePadding.verticalHight(),
                          child: ListTile(
                            onTap: emailAppRouter,
                            title: const Text('Contact Us',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            leading: Icon(
                              Icons.mark_email_unread_outlined,
                              color: context.colorScheme.primary,
                            ),
                            subtitle: const Text(
                                "Help, feedback, suggestions, and opinions..."),
                          ),
                        ),
                      ),
                  child: Text(_need)),
              TextButton(
                  onPressed: () =>
                      context.push(RouterKeys.RESET_PASSWORD.route),
                  child: Text(_forgetPassword)),
            ],
          ),
        ),
        Expanded(
          flex: 6,
          child: Row(
            children: [
              Expanded(
                  child: CommonElevationButton(
                onPressed: () {},
                child: Padding(
                  padding: PagePadding.allMedium(),
                  child: Text("Login", style: context.text.titleLarge),
                ),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
