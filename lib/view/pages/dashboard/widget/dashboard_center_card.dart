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
import '../../../../product/utility/durations.dart';
import '../../../../product/utility/page_padding.dart';
import '../model/get_restaurant_menus_response_model.dart';

class DasboardCenterCard extends StatefulWidget {
  const DasboardCenterCard({
    super.key,
    required this.menu,
    required this.provider,
    required this.deleteRestaurantMenu,
    required this.index,
    required this.length,
  });
  final RestaurantMenuData menu;
  final DashboardProvider provider;
  final int index;
  final int length;
  final Future<void> Function() deleteRestaurantMenu;

  @override
  State<DasboardCenterCard> createState() => _DasboardCenterCardState();
}

class _DasboardCenterCardState extends State<DasboardCenterCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: PageDurations.low(),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        reverseCurve: Curves.linear,
        parent: _animationController,
        curve: Interval(
          widget.index / widget.length,
          1.0,
          curve: Curves.easeInOut,
        ),
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, 1),
          end: Offset.zero,
        ).animate(_animationController),
        child: Padding(
          padding: PagePadding.allHeight(),
          child: InkWell(
            borderRadius: PageBorderRadius.allHeight(),
            onTap: () => context.pushNamed(RouterKeys.CATEGORY.name,
                queryParams: {"id": widget.menu.id, "name": widget.menu.name}),
            child: Card(
              child: Column(
                children: [
                  Expanded(
                      flex: 5,
                      child: ClipRRect(
                        borderRadius: PageBorderRadius.spesificTop(),
                        child: Stack(
                          children: [
                            widget.menu.coverImage == null
                                ? ImageKeys.default_image.imageAsset(
                                    width: context.width,
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    widget.menu.coverImage!,
                                    width: context.width,
                                    fit: BoxFit.cover,
                                  ),
                            Positioned(
                              right: 20,
                              top: 20,
                              child: Card(
                                child: Padding(
                                  padding: PagePadding.allMin(),
                                  child: Row(
                                    children: [
                                      Text(
                                        "0 ",
                                        style: TextStyle(
                                            fontSize: context
                                                .text.titleMedium?.fontSize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "views",
                                        style: TextStyle(
                                          fontSize: context
                                              .text.titleMedium?.fontSize,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: PagePadding.horizontalHeight(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.menu.name.toUpperCase(),
                              style: TextStyle(
                                  fontSize: context.text.titleLarge?.fontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                            PopupMenuButton(
                                onOpened: () => widget.provider
                                    .setSelectedMenuId(widget.menu.id),
                                onCanceled: () =>
                                    widget.provider.setSelectedMenuId(null),
                                itemBuilder: (context) => [
                                      PopupMenuItem(
                                          onTap: () =>
                                              widget.deleteRestaurantMenu(),
                                          child: ListTile(
                                            textColor:
                                                context.colorScheme.error,
                                            title: Text("Delete Menu"),
                                            leading: ImageKeys.delete.imageIcon(
                                              color: context.colorScheme.error,
                                            ),
                                          )),
                                      PopupMenuItem(
                                          onTap: () => context
                                              .pushNamed(RouterKeys.QR.name),
                                          child: ListTile(
                                            leading: ImageKeys.qr.imageIcon(
                                                color: context
                                                    .colorScheme.surface),
                                            title: Text("QR Code"),
                                          )),
                                    ])
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 3,
                    child: Row(children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Category items",
                              style: TextStyle(
                                fontSize: context.text.titleMedium?.fontSize,
                              ),
                            ),
                            Text(
                              "${widget.menu.categoryCount}",
                              style: TextStyle(
                                  fontSize: context.text.titleMedium?.fontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Total items",
                              style: TextStyle(
                                fontSize: context.text.titleMedium?.fontSize,
                              ),
                            ),
                            Text(
                              "${widget.menu.productCount}",
                              style: TextStyle(
                                  fontSize: context.text.titleMedium?.fontSize,
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
          ),
        ),
      ),
    );
  }
}
