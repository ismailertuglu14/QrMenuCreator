import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';

import '../../../../core/constans/enum/image_keys.dart';
import '../../../../core/constans/enum/lottie_keys.dart';
import '../../../../core/init/provider/dashboard_provider.dart';
import '../../../../product/utility/grid_delegates.dart';
import 'dashboard_center_card.dart';

class DashboardMenuBuilder extends StatelessWidget {
  const DashboardMenuBuilder({super.key, required this.deleteRestaurantMenu});
  final Future<void> Function() deleteRestaurantMenu;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        gridDelegate: PageGridDelegates.height(),
        itemCount: context.watch<DashboardProvider>().restaurantMenus?.length,
        itemBuilder: (context, index) => Consumer<DashboardProvider>(
              builder: (context, provider, child) =>
                  (provider.restaurantMenus == null || provider.isLoading)
                      ? LottieKeys.loading.path(width: context.width / 8)
                      : provider.restaurantMenus!.isEmpty
                          ? ImageKeys.empty_category.imageAsset()
                          : DasboardCenterCard(
                              index: index,
                              length: provider.restaurantMenus!.length,
                              deleteRestaurantMenu: deleteRestaurantMenu,
                              provider: provider,
                              menu: provider.restaurantMenus![index],
                            ),
            ));
  }
}
