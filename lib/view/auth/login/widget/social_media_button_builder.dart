import 'package:flutter/material.dart';

import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/outline_button.dart';
import '../service/social/Social_adapter.dart';

class SocialMediaButtonBuilder extends StatelessWidget {
  const SocialMediaButtonBuilder({
    super.key,
    required this.adapter,
    required this.onCompleted,
  });
  final ISocialAdapter adapter;
  final void Function(String token) onCompleted;
  @override
  Widget build(BuildContext context) {
    return CommonOutlineButton(
        style: OutlinedButton.styleFrom(
          shape: StadiumBorder(),
          backgroundColor: adapter.model.backgroundColor,
        ),
        onPressed: () async {
          try {
            final response = await adapter.socialLogin.call();
            if (response != null || response!.isEmpty) {
              onCompleted.call(response);
            }
          } catch (e) {
            throw Exception("$this data is null");
          }
        },
        child: Padding(
          padding: const PagePadding.allDefault(),
          child: adapter.model.icon,
        ));
  }
}
