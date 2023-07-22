import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/context_extension.dart';

import '../../../../product/utility/page_padding.dart';
import '../model/get_plan_response_model.dart';

class SubscriptionCardDescriptionBuilder extends StatelessWidget {
  const SubscriptionCardDescriptionBuilder({
    super.key,
    required this.features,
  });

  final List<SubscriptionFeature> features;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width / 1.5,
      height: context.height / 3,
      child: ListView.builder(
        itemCount: features.length,
        itemBuilder: (context, index) => Padding(
          padding: PagePadding.allMin(),
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Icon(Icons.check, color: context.colorScheme.primary)),
              Expanded(
                flex: 8,
                child: Padding(
                  padding: PagePadding.horizontalMin(),
                  child: Text(
                    (features[index]).description,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
