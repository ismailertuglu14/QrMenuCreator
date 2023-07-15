import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/init/provider/subscription_provider.dart';
import 'package:qrmenu/product/widget/custom_switch_list_tile.dart';

import '../../../../core/constans/enum/subscription_plan_keys.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';
import '../model/subscription_basic_plan_model.dart';
import '../model/subscription_pro_plan_model.dart';
import '../model/subscription_ultra_plan_model.dart';

class SubscriptionCard extends StatelessWidget {
  const SubscriptionCard({
    super.key,
    required this.title,
    required this.price,
    required this.planKey,
    required this.isSelected,
    required this.onTap,
  });
  final String title;
  final int price;

  final SubscriptionPlanKeys planKey;
  final bool isSelected;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.allHeight(),
      child: Card(
          color: context.colorScheme.onSecondary.withOpacity(0.8),
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
                      title,
                      style: TextStyle(
                          fontSize: context.text.titleLarge?.fontSize,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Consumer<SubscriptionProvider>(
                  builder: (context, provider, child) => Align(
                    alignment: Alignment.center,
                    child: Text(
                        provider.subscriptionPlanKeys ==
                                SubscriptionPlanKeys.Basic
                            ? "Free"
                            : "\$ ${(provider.isYearly ? price * 12 : price)}",
                        style: TextStyle(
                            color: context.colorScheme.surface,
                            fontSize: context.text.headlineSmall?.fontSize)),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Consumer<SubscriptionProvider>(
                  builder: (context, provider, child) => Padding(
                    padding: PagePadding.horizontalHeight(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                            child: Text("MONTHLY",
                                style: context.text.titleMedium)),
                        Flexible(
                          child: ListTileSwitch(
                            switchActiveColor: context.colorScheme.primary,
                            value: provider.isYearly,
                            onChanged: provider.changeSubscriptionType,
                          ),
                        ),
                        Flexible(
                            child: Text("YEARLY",
                                style: context.text.titleMedium)),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: SubscriptionCardDescriptionBuilder(planType: planKey)),
            ],
          )),
    );
  }
}

class SubscriptionCardDescriptionBuilder extends StatelessWidget {
  const SubscriptionCardDescriptionBuilder({
    super.key,
    required this.planType,
  });

  final SubscriptionPlanKeys planType;

  @override
  Widget build(BuildContext context) {
    List<dynamic> planModel;
    switch (planType) {
      case SubscriptionPlanKeys.Basic:
        planModel = SubscriptionBasicPlanModels.basicPlanList;
        break;
      case SubscriptionPlanKeys.Pro:
        planModel = SubscriptionProPlanModels.proPlanList;
        break;

      default:
        return ErrorWidget("Error");
    }
    return SizedBox(
      width: context.width / 1.5,
      height: context.height / 3,
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) => Padding(
                padding: PagePadding.allMin(),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.check,
                            color: context.colorScheme.primary)),
                    Expanded(
                      flex: 9,
                      child: Padding(
                        padding: PagePadding.horizontalMin(),
                        child: Text(
                          (planModel[index]).features,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          itemCount: planModel.length),
    );
  }
}
