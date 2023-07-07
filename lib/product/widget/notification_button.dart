import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/image_icon_extenison.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/product/utility/page_padding.dart';

import '../../core/constans/enum/lottie_keys.dart';
import '../utility/border_radius.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                alignment: Alignment.topCenter,
                title: const Text("Notifications", textAlign: TextAlign.center),
                shape: const RoundedRectangleBorder(
                    borderRadius: PageBorderRadius.spesificNotification()),
                children: [
                  Column(
                    children: [
                      LottieKeys.empty_notification
                          .path(width: context.width / 2),
                      Padding(
                        padding: PagePadding.allLow(),
                        child: Text(
                          "Noting to show here",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ],
              );
            }),
        icon: ImageKeys.notification
            .imageIcon(color: context.colorScheme.surface));
  }
}
