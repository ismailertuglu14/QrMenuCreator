import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/app/app_constants.dart';
import 'package:qrmenu/core/constans/enum/bottom_navi_bar_keys.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/core/constans/enum/lottie_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/core/init/provider/home_provider.dart';
import 'package:qrmenu/product/utility/page_padding.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';
import 'package:qrmenu/product/widget/email_app_router.dart';
import 'package:qrmenu/product/widget/url_app_router.dart';
import 'package:qrmenu/product/widget/user_circle_avatar.dart';
import 'package:qrmenu/view/pages/feedback/view/feed_back_view.dart';
import 'package:qrmenu/view/pages/profile/view/profile_view.dart';
import 'package:qrmenu/view/pages/subscription/view/subscription_view.dart';

import '../../../../core/constans/cache/locale_keys_enum.dart';
import '../../../../core/constans/enum/route_keys.dart';
import '../../../../core/constans/enum/theme_mode_keys.dart';
import '../../../../core/init/cache/local_storage.dart';
import '../../../../core/init/provider/theme_provider.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/durations.dart';
import '../../dashboard/view/dashboard_view.dart';
import '../widget/bottom_navi_bar.dart';
part '../viewmodel/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModels {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: BottomNaviBar(),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppConstants.APP_NAME),
        actions: [
          IconButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      alignment: Alignment.topCenter,
                      title: const Text("Notifications",
                          textAlign: TextAlign.center),
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              PageBorderRadius.spesificNotification()),
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
              icon: Icon(Icons.notifications_none_rounded))
        ],
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) => PageView.builder(
            controller: provider.pageController,
            itemCount: pageViewList.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => pageViewList[index]),
      ),
    );
  }
}

List<Widget> pageViewList = [
  DashboardView(),
  Container(),
  SubscriptionView(),
  ProfileView(),
];
