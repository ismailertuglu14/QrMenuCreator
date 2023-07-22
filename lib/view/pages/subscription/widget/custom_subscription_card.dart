import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/context_extension.dart';

import '../../../../core/init/provider/subscription_provider.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/custom_switch_list_tile.dart';
import 'custom_subscription_limit_builder.dart';

class CustomSubscriptionCard extends StatelessWidget {
  const CustomSubscriptionCard({
    super.key,
  });

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
          child: Consumer<SubscriptionProvider>(
            builder: (context, provider, child) => Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: context.colorScheme.primary,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Custom",
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
                          " ${(provider.customMenuLimit * 0.80 + provider.customProductCount * 0.20).round() * (provider.isYearly ? 12 : 1)} ₺",
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
                    flex: 3,
                    child: CustomSubscriptionLimitBuilder(
                        maxvalue: 500,
                        title: "Menu",
                        customMenuLimit: provider.customMenuLimit,
                        onChanged: provider.setCustomMenuLimit)),
                Expanded(
                    flex: 3,
                    child: CustomSubscriptionLimitBuilder(
                        maxvalue: 1000,
                        title: "Product",
                        customMenuLimit: provider.customProductCount,
                        onChanged: provider.setCustomProductCount)),
              ],
            ),
          )),
    );
  }
}
