import 'dart:async';
import 'package:app_version_update/app_version_update.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/product/utility/page_padding.dart';

import '../../../../core/constans/app/app_constants.dart';
import '../../../../core/constans/cache/locale_keys_enum.dart';
import '../../../../core/constans/enum/lottie_keys.dart';
import '../../../../core/constans/enum/route_keys.dart';

import '../../../../core/init/cache/local_storage.dart';
import '../../../../core/init/network/network_manager.dart';
import '../../../../core/init/update/Update_service.dart';
import '../../../../product/mixin/cache_init_mixin.dart';
import '../../../../product/utility/durations.dart';
part '../viewmodel/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends SplashViewModels {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            LottieKeys.SPLASH.path,
            height: context.height / 3,
            width: context.width / 1.2,
          ),
          AnimatedOpacity(
              opacity: _isFirstInit ? 1 : 0,
              duration: const PageDurations.normal(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: PagePadding.allDefault(),
                    child: Text(AppConstants.APP_NAME,
                        style: TextStyle(
                            fontSize: context.text.headlineLarge?.fontSize)),
                  ),
                  Text("Redefining Dining",
                      style: TextStyle(
                          color: context.colorScheme.surface.withOpacity(.5),
                          fontSize: context.text.titleSmall?.fontSize)),
                ],
              )),
        ],
      ),
    ));
  }
}
