import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
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
import 'package:qrmenu/product/widget/text_field.dart';
import 'package:qrmenu/product/widget/user_circle_avatar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/init/network/network_manager.dart';
import '../../../../core/init/provider/dashboard_provider.dart';
import '../../../../core/init/provider/home_provider.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/app_bar.dart';
import '../../../../product/widget/url_app_router.dart';
import '../../../auth/onboard/model/onboard_model.dart';
import '../model/create_menu_request_model.dart';
import '../model/create_menu_response_model.dart';
import '../model/delete_menu_request_model.dart';
import '../model/delete_restaurant_response_model.dart';
import '../model/get_restaurant_menus_response_model.dart';
import '../service/Dashboard_service.dart';
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
                      backgroundImage: ImageKeys.default_image.assetImage()),
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
            Expanded(
                flex: 5,
                child: Consumer<DashboardProvider>(
                  builder: (context, provider, child) =>
                      (provider.restaurantMenus == null || provider.isLoading)
                          ? LottieKeys.loading.path(width: context.width / 4)
                          : Column(
                              children: [
                                Expanded(
                                  flex: 20,
                                  child: PageView.builder(
                                      onPageChanged:
                                          provider.setSelectedMenuIndex,
                                      controller: provider.pageController,
                                      itemCount:
                                          provider.restaurantMenus!.length + 1,
                                      itemBuilder: (context, index) => (index !=
                                                  provider.restaurantMenus!
                                                      .length &&
                                              provider
                                                  .restaurantMenus!.isNotEmpty)
                                          ? DasboardCenterCard(
                                              deleteRestaurantMenu:
                                                  deleteRestaurantMenu,
                                              provider: provider,
                                              menu: provider
                                                  .restaurantMenus![index])
                                          : Padding(
                                              padding: PagePadding.allMedium(),
                                              child: Card(
                                                  child: Column(
                                                children: [
                                                  Expanded(
                                                    flex: 8,
                                                    child: LottieKeys
                                                        .create_new_item
                                                        .path(
                                                            width:
                                                                context.width /
                                                                    2),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: TextButton(
                                                        onPressed: () =>
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) =>
                                                                        Dialog(
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                PagePadding.allMedium(),
                                                                            child:
                                                                                Column(mainAxisSize: MainAxisSize.min, children: [
                                                                              Padding(
                                                                                padding: PagePadding.allMedium(),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      "Create Menu",
                                                                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: context.text.titleLarge?.fontSize),
                                                                                      textAlign: TextAlign.center,
                                                                                    ),
                                                                                    IconButton(onPressed: () => context.pop(), icon: Icon(Icons.close)),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              CommonTextField(
                                                                                label: Text("Menu Name"),
                                                                                textController: _menuNameController,
                                                                              ),
                                                                              Padding(
                                                                                padding: PagePadding.verticalHight(),
                                                                                child: Row(
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Consumer<DashboardProvider>(
                                                                                        builder: (context, provider, child) => provider.isLoading
                                                                                            ? LottieKeys.loading.path(width: context.width / 4, height: context.height / 15)
                                                                                            : CommonElevationButton(
                                                                                                child: Padding(
                                                                                                  padding: PagePadding.allMedium(),
                                                                                                  child: Text("Create"),
                                                                                                ),
                                                                                                onPressed: () {
                                                                                                  createMenu();
                                                                                                  _menuNameController.text.isNotEmpty ? context.pop() : null;
                                                                                                }),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              )
                                                                            ]),
                                                                          ),
                                                                        )),
                                                        child: Text(
                                                          "Create New Menu",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                  )
                                                ],
                                              )),
                                            )),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: AnimatedSmoothIndicator(
                                      effect: WormEffect(
                                          dotHeight: 2,
                                          dotWidth: 20,
                                          activeDotColor:
                                              context.colorScheme.primary),
                                      activeIndex: provider.selectedMenuIndex,
                                      count:
                                          provider.restaurantMenus!.length + 1),
                                ),
                              ],
                            ),
                )),
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
