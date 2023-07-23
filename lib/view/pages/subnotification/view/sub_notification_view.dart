import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/core/constans/enum/lottie_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/core/init/network/network_manager.dart';
import 'package:qrmenu/product/utility/page_padding.dart';
import 'package:qrmenu/product/widget/app_bar.dart';
import 'package:qrmenu/product/widget/blur.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';
import 'package:qrmenu/product/widget/outline_button.dart';
import 'package:qrmenu/view/auth/login/model/get_business_response_model.dart';
import 'package:qrmenu/view/pages/subscription/model/get_plan_response_model.dart';
import 'package:qrmenu/view/pages/subscription/service/Subscription_service.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../product/utility/border_radius.dart';
import '../../../../product/widget/custom_switch_list_tile.dart';

part '../viewmodel/sub_notification_view_model.dart';

class SubNotificationView extends StatefulWidget {
  const SubNotificationView({super.key});

  @override
  State<SubNotificationView> createState() => _SubNotificationViewState();
}

class _SubNotificationViewState extends SubNotificationViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
              height: context.height,
              child: Blur(
                blur: 10,
                child: LottieKeys.sub.path(
                    fit: BoxFit.cover,
                    height: context.height,
                    width: context.width),
              )),
          Positioned(
              top: 0,
              width: context.width,
              height: context.height * 0.1,
              child: Padding(
                padding: PagePadding.horizontalDefault(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CloseButton(),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Restore purchase",
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              )),
          Positioned(
              top: context.height * 0.1,
              width: context.width,
              height: context.height * 0.2,
              child: Center(child: LottieKeys.premium.path())),
          Positioned(
            top: context.height * 0.25,
            width: context.width,
            height: context.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Spacer(flex: 2),
                Expanded(
                  child: Padding(
                    padding: PagePadding.horizontalMedium(),
                    child: Text("BASIC",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: PagePadding.horizontalMedium(),
                    child: Text("PRO",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                Expanded(
                  child: Text("BUSINESS",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
          Positioned(
            width: context.width,
            top: context.height * 0.3,
            height: context.height * 0.15,
            child: Padding(
              padding: PagePadding.horizontalMedium(),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ListView.builder(
                      itemCount: features.length,
                      itemBuilder: (context, index) => Padding(
                        padding: PagePadding.allDefault(),
                        child: Text(features[index].features[index].description,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: features.length,
                      itemBuilder: (context, index) =>
                          features[0].features[index].isAvailable
                              ? Icon(Icons.check_rounded)
                              : Icon(Icons.minimize_rounded),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: features.length,
                      itemBuilder: (context, index) =>
                          features[1].features[index].isAvailable
                              ? Icon(Icons.check_rounded)
                              : Icon(Icons.minimize_rounded),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: features.length,
                      itemBuilder: (context, index) =>
                          features[2].features[index].isAvailable
                              ? Icon(Icons.check_rounded)
                              : Icon(Icons.minimize_rounded),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              width: context.width,
              top: context.height * 0.5,
              height: context.height * 0.2,
              child: PageView.builder(
                itemCount: features.length,
                onPageChanged: changeSelectedIndex,
                pageSnapping: true,
                padEnds: true,
                itemBuilder: (context, index) => Stack(
                  children: [
                    Positioned(
                      child: Padding(
                        padding: PagePadding.allHeight(),
                        child: Card(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    style: BorderStyle.solid,
                                    color: context.colorScheme.surface
                                        .withOpacity(0.8),
                                    width: 0.1),
                                borderRadius: PageBorderRadius.allMedium()),
                            color: Colors.white10,
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Card(
                                    margin: EdgeInsets.zero,
                                    color: context.colorScheme.primary,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        features[index].name,
                                        style: TextStyle(
                                            fontSize: context
                                                .text.titleLarge?.fontSize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding: PagePadding.allDefault(),
                                            child: Text(
                                                features[index].name == "Basic"
                                                    ? "Free"
                                                    : "\$ ${(_isYearly ? features[index].annuallyPrice * 12 : features[index].monthlyPrice)}",
                                                style: TextStyle(
                                                    color: context
                                                        .colorScheme.surface,
                                                    fontSize: context
                                                        .text
                                                        .headlineSmall
                                                        ?.fontSize)),
                                          ),
                                        ),
                                        features[index].name == "Basic"
                                            ? SizedBox.shrink()
                                            : Flexible(
                                                child: Text(
                                                  "${(_isYearly ? (features[index].annuallyPrice * ((features[index].annuallyDiscount + 100) / 100)).round() : (features[index].monthlyPrice * ((features[index].monthlyDiscount + 100) / 100))).round()}",
                                                  style: TextStyle(
                                                    color: context.colorScheme
                                                        .onBackground
                                                        .withOpacity(.5),
                                                    fontSize: context.text
                                                        .titleSmall?.fontSize,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    fontWeight: FontWeight.bold,
                                                    decorationColor: context
                                                        .colorScheme.background,
                                                    decorationThickness: 4,
                                                  ),
                                                ),
                                              ),
                                        Flexible(
                                          child: features[index].name == "Basic"
                                              ? SizedBox.shrink()
                                              : Padding(
                                                  padding: PagePadding.allLow(),
                                                  child: Text(
                                                      "Save ${(_isYearly ? features[index].annuallyDiscount : features[index].monthlyDiscount)} %"),
                                                ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: PagePadding.horizontalHeight(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                            child: Text("MONTHLY",
                                                style:
                                                    context.text.titleMedium)),
                                        Flexible(
                                          child: ListTileSwitch(
                                            switchActiveColor:
                                                context.colorScheme.primary,
                                            value: _isYearly,
                                            onChanged: changeIsYearly,
                                          ),
                                        ),
                                        Flexible(
                                            child: Row(
                                          children: [
                                            Text("YEARLY",
                                                style:
                                                    context.text.titleMedium),
                                          ],
                                        )),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              )),
          Positioned(
              width: context.width,
              top: context.height * 0.7,
              height: context.height * 0.1,
              child: Align(
                alignment: Alignment.center,
                child: AnimatedSmoothIndicator(
                    effect: ExpandingDotsEffect(
                        activeDotColor: context.colorScheme.primary,
                        dotColor: Colors.grey.shade500,
                        dotHeight: 2,
                        dotWidth: context.width * 0.03),
                    activeIndex: _selectedIndex,
                    count: features.length),
              )),
          Positioned(
            width: context.width,
            top: context.height * 0.75,
            height: context.height * 0.1,
            child: Padding(
              padding: PagePadding.horizontalHeight(),
              child: Row(
                children: [
                  Expanded(
                    child: CommonElevationButton(
                      child: Padding(
                        padding: PagePadding.allMedium(),
                        child: Text("Buy"),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              width: context.width,
              top: context.height * 0.9,
              child: Text(
                "One time payment for lifetime access",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: context.colorScheme.onSurface,
                    fontSize: context.text.bodySmall?.fontSize),
              )),
        ],
      ),
    );
  }
}
