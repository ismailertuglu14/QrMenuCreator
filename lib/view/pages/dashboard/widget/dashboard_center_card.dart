import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/core/extension/router_extension.dart';

import '../../../../core/constans/enum/lottie_keys.dart';
import '../../../../core/constans/enum/route_keys.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';

class DasboardCenterCard extends StatelessWidget {
  const DasboardCenterCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: PagePadding.allHeight(),
          child: InkWell(
            borderRadius: PageBorderRadius.allMedium(),
            onTap: () => context.push(RouterKeys.SECTIONS.route),
            child: Card(
              color: context.colorScheme.onSecondary.withOpacity(0.8),
              child: Column(
                children: [
                  Expanded(
                    flex: 7,
                    child: LottieKeys.dashboard.path(fit: BoxFit.cover),
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
                                      fontSize:
                                          context.text.titleLarge?.fontSize,
                                    ),
                                  ),
                                  Text(
                                    "51",
                                    style: TextStyle(
                                        fontSize:
                                            context.text.titleLarge?.fontSize,
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
                                      fontSize:
                                          context.text.titleLarge?.fontSize,
                                    ),
                                  ),
                                  Text(
                                    "156",
                                    style: TextStyle(
                                        fontSize:
                                            context.text.titleLarge?.fontSize,
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
        ),
        Positioned(
            right: 0,
            top: 0,
            child: LottieKeys.click.path(width: context.width / 3))
      ],
    );
  }
}
