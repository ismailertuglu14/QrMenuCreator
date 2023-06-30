import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/product/widget/custom_scroll_behavior.dart';
import 'package:qrmenu/product/widget/wire_dash_feed_back.dart';

import 'core/constans/app/app_constants.dart';
import 'core/init/app/init_app.dart';
import 'core/init/provider/providers.dart';
import 'core/init/provider/theme_provider.dart';
import 'core/init/router/router_manager.dart';
import 'core/init/theme/dark/dark_theme.dart';
import 'core/init/theme/light/light_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wiredash/wiredash.dart';

Future<void> main() async {
  await InitApp.initApp();
  runApp(MultiProvider(providers: Providers.providers, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WiredashFeedBack(
        child: ResponsiveSizer(
            builder: (context, orientation, screenType) => MaterialApp.router(
                  builder: FToastBuilder(),
                  title: AppConstants.APP_NAME,
                  routerConfig: RouterManager.routes,
                  debugShowCheckedModeBanner: false,
                  theme: LightThemeData.instance.theme,
                  scrollBehavior: CustomScrollBehavior(),
                  darkTheme: DarkThemeData.instance.theme,
                  themeMode: context.watch<ThemeProvider>().getThemeMode,
                )));
  }
}
