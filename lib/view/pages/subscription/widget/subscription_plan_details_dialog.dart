import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/cache/locale_keys_enum.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/init/cache/local_storage.dart';
import 'package:qrmenu/core/init/provider/subscription_provider.dart';
import 'package:qrmenu/view/pages/subscription/widget/subscription_stat_item_builder.dart';

import '../../../../product/utility/page_padding.dart';

class SubscriptionPlanDetailDialog extends StatelessWidget {
  const SubscriptionPlanDetailDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.25,
      child: Padding(
        padding: PagePadding.allMin(),
        child: Consumer<SubscriptionProvider>(
          builder: (context, provider, child) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                  title: Text(
                      LocaleStorage.instance
                          .getStringValue(LocaleKeys.SUBSCRIPTION_NAME),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(
                      LocaleStorage.instance
                          .getStringValue(LocaleKeys.SUBSCRIPTION_PERIOD),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Text(
                      LocaleStorage.instance
                          .getStringValue(LocaleKeys.SUBSCRIPTION_PRICE),
                      style: TextStyle(fontWeight: FontWeight.bold))),
              SubscriptonStatItemBuilder(
                  maxMenuCount: provider.planData![0].maxProductCount,
                  color: Color(0xFF7bd56c),
                  title: "Product Count",
                  currentMenuCount: 20),
              SubscriptonStatItemBuilder(
                  maxMenuCount: provider.planData![0].maxMenuCount,
                  color: Color(0xFFfeb956),
                  title: "Menu Count",
                  currentMenuCount: 1),
            ],
          ),
        ),
      ),
    );
  }
}
