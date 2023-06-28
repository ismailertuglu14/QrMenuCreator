import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';

import '../../core/constans/enum/lottie_keys.dart';
import '../utility/page_padding.dart';

class CommonErrorWidget extends StatelessWidget {
  final String? error;
  const CommonErrorWidget({
    super.key,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const PagePadding.allHeight(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieKeys.error
                .path(height: context.height / 4, width: context.width / 3),
            Padding(
              padding: const PagePadding.horizontalHeight(),
              child: Text(
                "${error?.toString()}".toUpperCase(),
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                    color: Theme.of(context).colorScheme.error),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
