import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/context_extension.dart';

import '../../../../product/utility/page_padding.dart';

class CustomSubscriptionLimitBuilder extends StatelessWidget {
  const CustomSubscriptionLimitBuilder({
    super.key,
    required this.customMenuLimit,
    required this.onChanged,
    required this.title,
    required this.maxvalue,
  });
  final double customMenuLimit;
  final String title;
  final double maxvalue;
  final void Function(double value) onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.horizontalMedium(),
      child: Row(
        children: [
          Expanded(
              flex: 2, child: Text(title, style: context.text.titleMedium)),
          Expanded(
            flex: 8,
            child: Slider(
              min: 0,
              max: maxvalue,
              value: customMenuLimit,
              onChanged: onChanged,
            ),
          ),
          Expanded(flex: 1, child: Text(customMenuLimit.toStringAsFixed(0))),
        ],
      ),
    );
  }
}
