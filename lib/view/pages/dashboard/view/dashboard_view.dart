import 'package:flutter/material.dart';
import 'package:qrmenu/core/constans/enum/bottom_navi_bar_keys.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/core/constans/enum/lottie_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';
import 'package:qrmenu/product/widget/user_circle_avatar.dart';

import '../../../../core/init/provider/home_provider.dart';
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
                  "Hüseyin Ahmet Ülker",
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dashboard",
                      style: TextStyle(
                          fontSize: context.text.headlineSmall?.fontSize),
                    ),
                    Text(
                      "Here you can manage your bussniess.Tap on the bussniess name to start adding sections and items to your menu",
                      style: TextStyle(
                          fontSize: context.text.titleMedium?.fontSize),
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 5,
              child: Card(
                color: Colors.red,
                child: Row(children: [
                  Text("Total Views"),
                  DropdownButton(
                    items: const [
                      DropdownMenuItem(
                        value: 1,
                        child: Text("Opening Hours"),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Text("View QR Menu"),
                      ),
                      DropdownMenuItem(
                        value: 3,
                        child: Text("Edit"),
                      ),
                    ],
                    onChanged: (value) {},
                  )
                ]),
              )),
          Expanded(
            flex: 1,
            child: ListTile(
              title: Text("Web Dashboard"),
              onTap: () => urlAppRouter("https://www.instagram.com/"),
              leading: Icon(Icons.web_outlined),
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
