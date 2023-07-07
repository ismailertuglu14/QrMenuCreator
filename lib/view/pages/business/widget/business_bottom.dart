import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/cache/locale_keys_enum.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/core/init/cache/local_storage.dart';
import 'package:qrmenu/core/init/provider/business_provider.dart';
import 'package:qrmenu/product/widget/text_field.dart';
import 'package:qrmenu/view/pages/business/widget/log_out_dialog.dart';
import 'package:qrmenu/view/pages/business/widget/profile_list_tile_builder.dart';
import 'package:qrmenu/view/pages/business/widget/settings_theme_switch_builder.dart';
import 'package:wiredash/wiredash.dart';

import '../../../../core/constans/enum/image_keys.dart';
import '../../../../core/constans/enum/route_keys.dart';
import '../../../../core/constans/enum/theme_mode_keys.dart';
import '../../../../core/init/provider/login_provider.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/countrycodepicker/country_codes.dart';
import '../../../../product/widget/elevation_button.dart';
import '../../../../product/widget/email_app_router.dart';
import 'business_header.dart';
import 'log_out_button.dart';

class BusinessBottom extends StatelessWidget {
  const BusinessBottom({
    super.key,
    required LoginProvider loginProvider,
  }) : _loginProvider = loginProvider;

  final LoginProvider _loginProvider;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Row(
          children: [
            Padding(
              padding: PagePadding.allMedium(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Ercan Burger",
                      style: TextStyle(
                          fontSize: context.text.headlineSmall?.fontSize,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "ercanburger@gmail.com",
                      style: TextStyle(
                          fontSize: context.text.titleMedium?.fontSize),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      ProfileListTileBuilder(
        title: "Edit Business",
        onTap: () => context.push(RouterKeys.EDIT_BUSINESS.route),
        leading: ImageKeys.edit_business,
      ),
      ProfileListTileBuilder(
          leading: ImageKeys.change_theme,
          title: "Theme Mode",
          onTap: () => showModalBottomSheet(
              showDragHandle: true,
              context: context,
              builder: (context) => Wrap(
                    children: [
                      settingsThemeSwitchBuilder(
                          context, "System", ThemeModekeys.SYSTEM),
                      settingsThemeSwitchBuilder(
                          context, "Light", ThemeModekeys.LIGHT),
                      settingsThemeSwitchBuilder(
                        context,
                        "Dark",
                        ThemeModekeys.DARK,
                      ),
                    ],
                  ))),
      ProfileListTileBuilder(
        title: "Language",
        leading: ImageKeys.language,
        onTap: () => showDialog(
            context: context,
            builder: (context) => Dialog(
                  child: Padding(
                    padding: PagePadding.allLow(),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Flexible(
                          flex: 1,
                          child: Consumer<BusinessProvider>(
                            builder: (context, provider, child) =>
                                CommonTextField(
                              prefixIcon: Icon(Icons.search),
                              hideInputDecoration: true,
                              hintText: "Search Language",
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.search,
                              onChanged: provider.searchCountry,
                            ),
                          )),
                      Flexible(
                        flex: 9,
                        child: Container(
                          constraints:
                              BoxConstraints(maxHeight: context.height / 2),
                          child: Scrollbar(
                            child: Consumer<BusinessProvider>(
                              builder: (context, provider, child) =>
                                  ListView.builder(
                                      itemCount:
                                          provider.localCountryCodes.length,
                                      itemBuilder: (context, index) =>
                                          RadioListTile(
                                            title: Text(provider
                                                    .localCountryCodes[index]
                                                ["name"]!),
                                            value: provider
                                                    .localCountryCodes[index]
                                                ["name"]!,
                                            groupValue:
                                                provider.selectedCountryName,
                                            onChanged: (value) =>
                                                provider.selectCountry(
                                                    value as String, index),
                                          )),
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                )),
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
        onTap: () {},
        leading: ImageKeys.delete_account,
      ),
      LogOutButton(loginProvider: _loginProvider),
    ]);
  }
}
