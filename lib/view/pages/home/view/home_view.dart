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
import 'package:qrmenu/core/extension/image_icon_extenison.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/core/init/provider/home_provider.dart';
import 'package:qrmenu/product/utility/page_padding.dart';
import 'package:qrmenu/product/widget/app_bar.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';
import 'package:qrmenu/product/widget/email_app_router.dart';
import 'package:qrmenu/product/widget/url_app_router.dart';
import 'package:qrmenu/product/widget/user_circle_avatar.dart';
import 'package:qrmenu/view/pages/feedback/view/feed_back_view.dart';
import 'package:qrmenu/view/pages/subscription/view/subscription_view.dart';

import '../../../../core/constans/cache/locale_keys_enum.dart';
import '../../../../core/constans/enum/route_keys.dart';
import '../../../../core/constans/enum/theme_mode_keys.dart';
import '../../../../core/init/cache/local_storage.dart';
import '../../../../core/init/network/network_change_manager.dart';
import '../../../../core/init/provider/theme_provider.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/durations.dart';
import '../../../../product/widget/notification_button.dart';
import '../../business/view/business_view.dart';
import '../../dashboard/view/dashboard_view.dart';
import '../../templates/view/templates_view.dart';
import '../widget/bottom_navi_bar.dart';
part '../viewmodel/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModels
    with AutomaticKeepAliveClientMixin, StateMixin {
  late final INetworkChangeManager _networkChange;
  NetworkResult? _networkResult;

  @override
  void initState() {
    super.initState();

    _networkChange = NetworkChangeManager();
    waitForScreen(() =>
        _networkChange.handleNetworkChange((result) => _updateView(result)));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      bottomSheet: AnimatedContainer(
        duration: const PageDurations.min(),
        decoration: BoxDecoration(
            borderRadius: const PageBorderRadius.spesificTop(),
            color: context.colorScheme.primary),
        height: _networkResult == NetworkResult.on ? 0 : context.height / 20,
        child: const Center(child: Text("No Internet Connection")),
      ),
      bottomNavigationBar: BottomNaviBar(),
      appBar: CommonAppBar(
        automaticallyImplyLeading: false,
        title: Text(AppConstants.APP_NAME),
        action: [
          NotificationButton(),
          IconButton(
              onPressed: () => context.push(RouterKeys.QR.route),
              icon: ImageKeys.qr.imageIcon(color: context.colorScheme.surface))
        ],
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) => PageView.builder(
            itemCount: pageViewList.length,
            controller: provider.pageController,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => pageViewList[index]),
      ),
    );
  }

  Future<void> fetchFirstResult() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final result = await _networkChange.checkNetworkFirstTime();
      _updateView(result);
    });
  }

  void _updateView(NetworkResult result) =>
      setState(() => _networkResult = result);

  @override
  bool get wantKeepAlive => true;
}

mixin StateMixin<T extends StatefulWidget> on State<T> {
  void waitForScreen(VoidCallback onComplete) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onComplete.call();
    });
  }
}
