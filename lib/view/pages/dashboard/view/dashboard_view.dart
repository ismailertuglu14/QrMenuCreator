import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qrmenu/core/constans/enum/bottom_navi_bar_keys.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/core/constans/enum/lottie_keys.dart';
import 'package:qrmenu/core/constans/enum/route_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';
import 'package:qrmenu/product/widget/user_circle_avatar.dart';

import '../../../../core/init/provider/home_provider.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/url_app_router.dart';
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
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UserCircleAvatar(
                backgroundImage: ImageKeys.default_cover.assetImage()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Welcome Back"),
                Text(
                  "Ercan Burger",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: PagePadding.allMedium(),
                child: Text(
                  "Here you can manage your bussniess.Tap on the bussniess name to start adding sections and items to your menu",
                  style:
                      TextStyle(fontSize: context.text.titleMedium?.fontSize),
                ),
              )),
          Expanded(
              flex: 5,
              child: Padding(
                padding: PagePadding.allHeight(),
                child: InkWell(
                  borderRadius: PageBorderRadius.allMedium(),
                  onTap: () => context.push(RouterKeys.SECTIONS.route),
                  child: Card(
                    color: context.colorScheme.onSecondary.withOpacity(0.8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Total items",
                                          style: TextStyle(
                                            fontSize: context
                                                .text.titleLarge?.fontSize,
                                          ),
                                        ),
                                        Text(
                                          "51",
                                          style: TextStyle(
                                              fontSize: context
                                                  .text.titleLarge?.fontSize,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Menu views",
                                          style: TextStyle(
                                            fontSize: context
                                                .text.titleLarge?.fontSize,
                                          ),
                                        ),
                                        Text(
                                          "156",
                                          style: TextStyle(
                                              fontSize: context
                                                  .text.titleLarge?.fontSize,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                            Expanded(
                              flex: 2,
                              child: PopupMenuButton(
                                  itemBuilder: (context) => [
                                        PopupMenuItem(
                                          onTap: () =>
                                              context.push(RouterKeys.QR.route),
                                          child: Text("View QR Menu"),
                                        ),
                                      ]),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Expanded(
            flex: 1,
            child: ListTile(
              title: Text("Web Dashboard"),
              onTap: () => urlAppRouter("https://www.instagram.com/"),
              leading:
                  ImageKeys.web_dashboard.imageAsset(width: context.width / 15),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: PagePadding.allMedium(),
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
            ),
          )
        ],
      ),
    );
  }
}
