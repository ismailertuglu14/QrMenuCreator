import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/image_icon_extenison.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/product/widget/user_circle_avatar.dart';
import 'package:wiredash/wiredash.dart';

import '../../../../core/constans/cache/locale_keys_enum.dart';
import '../../../../core/constans/enum/bottom_navi_bar_keys.dart';
import '../../../../core/constans/enum/route_keys.dart';
import '../../../../core/constans/enum/subscription_plan_keys.dart';
import '../../../../core/constans/enum/theme_mode_keys.dart';
import '../../../../core/init/cache/local_storage.dart';
import '../../../../core/init/provider/home_provider.dart';
import '../../../../core/init/provider/login_provider.dart';
import '../../../../core/init/provider/theme_provider.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/elevation_button.dart';
import '../../../../product/widget/email_app_router.dart';
import '../widget/business_bottom.dart';
import '../widget/business_header.dart';

part '../viewmodel/business_view_model.dart';

class BusinessView extends StatefulWidget {
  const BusinessView({Key? key}) : super(key: key);

  @override
  State<BusinessView> createState() => _BusinessViewState();
}

class _BusinessViewState extends BusinessViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: PagePadding.allDefault(),
        child: Column(children: [
          Expanded(
            flex: 2,
            child: BusinessHeader(),
          ),
          Expanded(
              flex: 8,
              child: BusinessBottom(
                loginProvider: _loginProvider,
              )),
        ]),
      ),
    );
  }
}
