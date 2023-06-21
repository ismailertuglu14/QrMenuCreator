import 'package:flutter/material.dart';


import '../../../core/constans/enum/lottie_keys.dart';
import '../../../product/utility/page_padding.dart';

class CommonErrorView extends StatelessWidget {
  final Exception? error;
  const CommonErrorView({
    super.key,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const PagePadding.allHeight(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*lottieItemBuilder(LottieKeys.error.path,
                  height: context.height / 4, width: context.width / 3),*/
              Padding(
                padding: const PagePadding.horizontalHeight(),
                child: Text(
                  "${error?.toString()}".toUpperCase(),
                  style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.titleLarge?.fontSize,
                      color: Theme.of(context).colorScheme.error),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
