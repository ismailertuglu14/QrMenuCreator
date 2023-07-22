import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/init/provider/subscription_provider.dart';
import 'package:qrmenu/product/widget/custom_switch_list_tile.dart';
import 'package:qrmenu/view/pages/subscription/widget/subscripion_card_description_builder.dart';

import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';
import '../model/get_plan_response_model.dart';
import '../model/subscription_basic_plan_model.dart';
import '../model/subscription_pro_plan_model.dart';

class SubscriptionCard extends StatelessWidget {
  const SubscriptionCard({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    required this.planData,
  });
  final String title;

  final GetPlanData planData;

  final bool isSelected;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.allHeight(),
      child: Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  style: BorderStyle.solid,
                  color: context.colorScheme.surface.withOpacity(0.8),
                  width: 0.1),
              borderRadius: PageBorderRadius.allMedium()),
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
                        planData.name == "Basic"
                            ? "Free"
                            : "\$ ${(provider.isYearly ? planData.annuallyPrice * 12 : planData.monthlyPrice)}",
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
                        /*Flexible(
                          child: planData.name == "Basic"
                              ? SizedBox.shrink()
                              : Padding(
                                  padding: PagePadding.allLow(),
                                  child: Text(
                                      "Save ${(provider.isYearly ? planData.annuallyDiscount : planData.monthlyDiscount)} %"),
                                ),
                        )*/
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: SubscriptionCardDescriptionBuilder(
                      features: planData.features)),
            ],
          )),
    );
  }
}
