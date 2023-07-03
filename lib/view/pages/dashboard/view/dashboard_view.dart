import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qrmenu/core/constans/app/app_constants.dart';
import 'package:qrmenu/core/constans/enum/bottom_navi_bar_keys.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/core/constans/enum/lottie_keys.dart';
import 'package:qrmenu/core/constans/enum/route_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/image_icon_extenison.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';
import 'package:qrmenu/product/widget/user_circle_avatar.dart';

import '../../../../core/init/provider/home_provider.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/app_bar.dart';
import '../../../../product/widget/url_app_router.dart';
import '../widget/dashboard_center_card.dart';

part '../viewmodel/dashboard_view_model.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends DashboardViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: PagePadding.allMedium(),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UserCircleAvatar(
                      backgroundImage: ImageKeys.default_cover.assetImage()),
                  Padding(
                    padding: PagePadding.horizontalHeight(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome Back",
                          style: context.text.headlineSmall,
                        ),
                        Text(
                          "Ercan Burger",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: context.text.titleLarge?.fontSize),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(flex: 5, child: DasboardCenterCard()),
            Expanded(
              flex: 1,
              child: ListTile(
                title: Text("Web Dashboard"),
                onTap: () => urlAppRouter(AppConstants.APP_WEB_DASHBOARD_URL),
                leading: Icon(Icons.web_outlined),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: CommonElevationButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageKeys.premium
                              .imageAsset(width: context.width / 5),
                          const Text("Upgrade plan"),
                        ],
                      ),
                      onPressed: () => _homeProvider.changeCurrentIndex(
                          BottomNaviBarKeys.Subscription.index),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
