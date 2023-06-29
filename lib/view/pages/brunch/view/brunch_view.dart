import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qrmenu/core/constans/enum/route_keys.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/product/widget/app_bar.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';

import '../../../../product/utility/page_padding.dart';
part '../viewmodel/brunch_view_model.dart';

class BrunchView extends StatefulWidget {
  const BrunchView({Key? key}) : super(key: key);

  @override
  State<BrunchView> createState() => _BrunchViewState();
}

class _BrunchViewState extends BrunchViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: PagePadding.allDefault(),
        child: CommonElevationButton(
          child: Padding(
            padding: PagePadding.allHeight(),
            child: Text("Add Selection Item"),
          ),
          onPressed: () => context.push(RouterKeys.CREATE_ITEM.route),
        ),
      ),
      appBar: CommonAppBar(title: Text("Brunch")),
    );
  }
}
