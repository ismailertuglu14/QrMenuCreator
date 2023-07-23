import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/enum/lottie_keys.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/core/init/network/network_manager.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';
import 'package:qrmenu/view/pages/subscription/service/Subscription_service.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/init/provider/subscription_provider.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../auth/onboard/model/onboard_model.dart';
import '../../dashboard/model/get_restaurant_menus_response_model.dart';
import '../../dashboard/service/Dashboard_service.dart';
import '../../products/service/Product_service.dart';
import '../model/get_plan_response_model.dart';
import '../widget/custom_subscription_card.dart';
import '../widget/subscription_card.dart';
import '../widget/subscription_plan_details_dialog.dart';
import '../widget/subscription_stat_item_builder.dart';

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
      body: Consumer<SubscriptionProvider>(
        builder: (context, provider, child) => (provider.planData == null ||
                provider.isLoading)
            ? Center(child: LottieKeys.loading.path())
            : Column(children: [
                Expanded(flex: 2, child: LottieKeys.premium.path()),
                Expanded(
                  flex: 5,
                  child: PageView.builder(
                      itemCount: provider.planData!.length + 1,
                      onPageChanged: (value) =>
                          provider.setSelectedPlanIndex(value),
                      itemBuilder: (context, index) =>
                          index == provider.planData!.length
                              ? CustomSubscriptionCard()
                              : SubscriptionCard(
                                  planData: provider.planData![index],
                                  title: provider.planData![index].name,
                                  isSelected: false,
                                  onTap: () {},
                                )),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: PagePadding.horizontalHeight(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            flex: 1,
                            child: AnimatedSmoothIndicator(
                                effect: WormEffect(
                                    dotHeight: 10,
                                    dotWidth: 10,
                                    activeDotColor:
                                        context.colorScheme.primary),
                                activeIndex: provider.selectedPlanIndex,
                                count: provider.planData!.length + 1)),
                        Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () => showModalBottomSheet(
                                showDragHandle: true,
                                context: context,
                                builder: (context) =>
                                    SubscriptionPlanDetailDialog()),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Icon(Icons.info_outline_rounded)),
                                Expanded(
                                  flex: 8,
                                  child: Text(
                                    "Current Plan Details",
                                    style: context.text.titleMedium!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Row(
                            children: [
                              Expanded(
                                  child: CommonElevationButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      provider.selectedPlanIndex == 0
                                          ? context.colorScheme.surface
                                              .withOpacity(0.5)
                                          : context.colorScheme.primary,
                                ),
                                onPressed: () {},
                                child: Padding(
                                  padding: PagePadding.allHeight(),
                                  child: Text(provider.selectedPlanIndex ==
                                          provider.planData!.length
                                      ? "Create"
                                      : "Buy Now"),
                                ),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
      ),
    );
  }
}
