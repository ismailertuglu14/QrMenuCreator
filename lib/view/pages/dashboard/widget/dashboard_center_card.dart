import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/image_icon_extenison.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/core/init/provider/dashboard_provider.dart';

import '../../../../core/constans/enum/lottie_keys.dart';
import '../../../../core/constans/enum/route_keys.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';
import '../model/get_restaurant_menus_response_model.dart';

class DasboardCenterCard extends StatelessWidget {
  const DasboardCenterCard({
    super.key,
    required this.menu,
    required this.provider,
    required this.deleteRestaurantMenu,
  });
  final RestaurantMenuData menu;
  final DashboardProvider provider;
  final Future<void> Function() deleteRestaurantMenu;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.allHeight(),
      child: InkWell(
        borderRadius: PageBorderRadius.allHeight(),
        onTap: () => context.pushNamed(RouterKeys.CATEGORY.name,
            queryParams: {"id": menu.id, "name": menu.name}),
        child: Card(
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: PagePadding.horizontalHeight(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          menu.name.toUpperCase(),
                          style: TextStyle(
                              fontSize: context.text.titleLarge?.fontSize,
                              fontWeight: FontWeight.bold),
                        ),
                        PopupMenuButton(
                            onOpened: () => provider.setSelectedMenuId(menu.id),
                            onCanceled: () => provider.setSelectedMenuId(null),
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                      onTap: () => deleteRestaurantMenu(),
                                      child: ListTile(
                                        textColor: context.colorScheme.error,
                                        title: Text("Delete Menu"),
                                        leading: ImageKeys.delete.imageIcon(
                                          color: context.colorScheme.error,
                                        ),
                                      )),
                                  PopupMenuItem(
                                      onTap: () =>
                                          context.pushNamed(RouterKeys.QR.name),
                                      child: ListTile(
                                        leading: ImageKeys.qr.imageIcon(
                                            color: context.colorScheme.surface),
                                        title: Text("QR Code"),
                                      )),
                                ])
                      ],
                    ),
                  )),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: PagePadding.allMedium(),
                  child: ImageKeys.chef.imageAsset(),
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Row(children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Total items",
                                style: TextStyle(
                                  fontSize: context.text.titleLarge?.fontSize,
                                ),
                              ),
                              Text(
                                "${menu.productCount}",
                                style: TextStyle(
                                    fontSize: context.text.titleLarge?.fontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Menu views",
                                style: TextStyle(
                                  fontSize: context.text.titleLarge?.fontSize,
                                ),
                              ),
                              Text(
                                "156",
                                style: TextStyle(
                                    fontSize: context.text.titleLarge?.fontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
