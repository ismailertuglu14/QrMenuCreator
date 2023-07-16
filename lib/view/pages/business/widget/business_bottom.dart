import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/app/app_constants.dart';
import 'package:qrmenu/core/constans/cache/locale_keys_enum.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/image_icon_extenison.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/core/init/cache/local_storage.dart';
import 'package:qrmenu/product/utility/border_radius.dart';
import 'package:qrmenu/product/utility/zoom_tap_animation.dart';
import 'package:qrmenu/product/widget/custom_switch_list_tile.dart';
import 'package:qrmenu/product/widget/text_field.dart';
import 'package:qrmenu/product/widget/url_app_router.dart';
import 'package:qrmenu/view/pages/business/widget/log_out_dialog.dart';
import 'package:qrmenu/view/pages/business/widget/profile_list_tile_builder.dart';
import 'package:wiredash/wiredash.dart';

import '../../../../core/constans/enum/image_keys.dart';
import '../../../../core/constans/enum/route_keys.dart';
import '../../../../core/constans/enum/theme_mode_keys.dart';
import '../../../../core/init/provider/login_provider.dart';
import '../../../../core/init/provider/theme_provider.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/countrycodepicker/country_codes.dart';
import '../../../../product/widget/elevation_button.dart';
import '../../../../product/widget/email_app_router.dart';
import 'app_version_dialog.dart';
import 'business_header.dart';

class BusinessBottom extends StatelessWidget {
  const BusinessBottom({
    super.key,
    required LoginProvider loginProvider,
  }) : _loginProvider = loginProvider;

  final LoginProvider _loginProvider;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Flexible(
        child: Consumer<ThemeProvider>(
            builder: (context, provider, child) => ListTileSwitch(
                  leading: ImageKeys.theme_mode
                      .imageIcon(color: context.colorScheme.surface),
                  switchActiveColor: context.colorScheme.primary,
                  onChanged: provider.changeTheme,
                  value: provider.isDark!,
                  title: Text("Dark Mode",
                      style: TextStyle(color: context.colorScheme.surface)),
                )),
      ),
      ProfileListTileBuilder(
        title: "Change Password",
        onTap: () => context.push(RouterKeys.CHANGE_PASSWORD.route),
        leading: ImageKeys.change_password,
      ),
      ProfileListTileBuilder(
        title: "Language",
        leading: ImageKeys.language,
        onTap: () => context.push(RouterKeys.CHANGE_LANGUAGE.route),
      ),
      ProfileListTileBuilder(
        title: "Contact Us",
        onTap: () => emailAppRouter(),
        leading: ImageKeys.contact_us,
      ),
      ProfileListTileBuilder(
        title: "App Feedback",
        onTap: () => Wiredash.of(context).show(inheritMaterialTheme: true),
        leading: ImageKeys.app_feedback,
      ),
      ProfileListTileBuilder(
        title: "Delete Account",
        onTap: () => context.push(RouterKeys.DELETE_BUSINESS.route),
        leading: ImageKeys.delete_account,
      ),
      ProfileListTileBuilder(
        title: "Privacy Policy",
        onTap: () => urlAppRouter("https://www.google.com/"),
        leading: ImageKeys.privacy_policy,
      ),
      ProfileListTileBuilder(
        title: "Rate App",
        onTap: () {},
        leading: ImageKeys.rate_app,
      ),
      ProfileListTileBuilder(
        title: "Version",
        onTap: () => appVersionDialog(context),
        leading: ImageKeys.info,
      ),
      Row(
        children: [
          Expanded(
            child: Padding(
              padding: PagePadding.allLow(),
              child: GestureDetector(
                onTap: () => showDialog(
                    context: context,
                    builder: (context) => logOutDialog(context)),
                child: ZoomTapAnimation(
                  child: Container(
                    decoration: BoxDecoration(
                        color: context.colorScheme.primary,
                        borderRadius: PageBorderRadius.allMedium()),
                    child: Padding(
                      padding: PagePadding.allMedium(),
                      child: Center(
                        child: Text("Log Out",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: context.text.titleMedium?.fontSize)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    ]);
  }
}
