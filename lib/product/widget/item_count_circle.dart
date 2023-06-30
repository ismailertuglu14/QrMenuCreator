import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/product/utility/page_padding.dart';

class ItemCountCircle extends StatelessWidget {
  const ItemCountCircle({
    super.key,
    required this.count,
  });
  final int count;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.horizontalHeight(),
      child: CircleAvatar(
          maxRadius: 15,
          minRadius: 10,
          foregroundColor: Colors.white,
          backgroundColor: context.colorScheme.primary,
          child: Text(count.toString())),
    );
  }
}
