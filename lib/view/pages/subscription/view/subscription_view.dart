import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/enum/lottie_keys.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/constans/enum/subscription_plan_keys.dart';
import '../../../../core/init/provider/subscription_provider.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../auth/onboard/model/onboard_model.dart';
import '../widget/subscription_card.dart';

part '../viewmodel/subscription_view_model.dart';

class SubscriptionView extends StatefulWidget {
  const SubscriptionView({super.key});

  @override
  State<SubscriptionView> createState() => _SubscriptionState();
}

class _SubscriptionState extends SubscriptionViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(flex: 2, child: LottieKeys.premium.path()),
        Expanded(
          flex: 6,
          child: Consumer<SubscriptionProvider>(
            builder: (context, provider, child) => PageView.custom(
                onPageChanged: (value) => provider
                    .changeSubscriptionPlan(SubscriptionPlanKeys.values[value]),
                childrenDelegate: SliverChildListDelegate.fixed([
                  SubscriptionCard(
                    title: "Basic",
                    price: 5,
                    planKey: SubscriptionPlanKeys.Basic,
                    isSelected: false,
                    onTap: () => provider
                        .changeSubscriptionPlan(SubscriptionPlanKeys.Basic),
                  ),
                  SubscriptionCard(
                    title: "Pro",
                    price: 10,
                    planKey: SubscriptionPlanKeys.Pro,
                    isSelected: false,
                    onTap: () => provider
                        .changeSubscriptionPlan(SubscriptionPlanKeys.Pro),
                  ),
                  SubscriptionCard(
                    title: "Ultra",
                    price: 25,
                    planKey: SubscriptionPlanKeys.Ultra,
                    isSelected: false,
                    onTap: () => provider
                        .changeSubscriptionPlan(SubscriptionPlanKeys.Ultra),
                  ),
                ])),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: PagePadding.allHeight(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Consumer<SubscriptionProvider>(
                  builder: (context, provider, child) =>
                      AnimatedSmoothIndicator(
                          effect: WormEffect(
                              dotHeight: 10,
                              dotWidth: 10,
                              activeDotColor: context.colorScheme.primary),
                          activeIndex: provider.subscriptionPlanKeys.index,
                          count: SubscriptionPlanKeys.values.length),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Consumer<SubscriptionProvider>(
                      builder: (context, provider, child) => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: provider.subscriptionPlanKeys ==
                                  SubscriptionPlanKeys.Basic
                              ? context.colorScheme.surface.withOpacity(0.5)
                              : context.colorScheme.primary,
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: PagePadding.allHeight(),
                          child: Text("Buy Now"),
                        ),
                      ),
                    )),
                  ],
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
