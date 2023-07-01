import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';

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
                      LottieKeys.empty_notification.path(),
                      Text(
                        "Noting to show here",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              );
            }),
        icon: Icon(Icons.notifications_none_rounded));
  }
}
