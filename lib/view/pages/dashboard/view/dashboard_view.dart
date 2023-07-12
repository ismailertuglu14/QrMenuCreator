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
import 'package:qrmenu/core/extension/imag_path_extension.dart';
import 'package:qrmenu/core/extension/image_icon_extenison.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/product/utility/durations.dart';
import 'package:qrmenu/product/utility/grid_delegates.dart';
import 'package:qrmenu/product/utility/zoom_tap_animation.dart';
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
import '../widget/create_menu_dialog.dart';
import '../widget/dashboard_app_bar.dart';
import '../widget/dashboard_center_card.dart';
import '../widget/dashboard_create_menu_button.dart';
import '../widget/dashboard_menu_builder.dart';

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
        resizeToAvoidBottomInset: false,
        floatingActionButton: DashboardCreateMenuButton(
          createMenu: createMenu,
        ),
        body: RefreshIndicator(
          onRefresh: () => getRestaurantMenus(),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              DashboardAppBar(),
              DashboardMenuBuilder(deleteRestaurantMenu: deleteRestaurantMenu)
            ],
          ),
        ));
  }
}
