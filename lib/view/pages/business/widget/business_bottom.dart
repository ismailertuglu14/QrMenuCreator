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
import 'package:qrmenu/core/init/provider/business_provider.dart';
import 'package:qrmenu/product/utility/border_radius.dart';
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
import 'log_out_button.dart';

class BusinessBottom extends StatelessWidget {
  const BusinessBottom({
    super.key,
    required LoginProvider loginProvider,
  }) : _loginProvider = loginProvider;

  final LoginProvider _loginProvider;

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Consumer<ThemeProvider>(
          builder: (context, provider, child) => ListTileSwitch(
                leading: ImageKeys.change_theme
                    .imageIcon(color: context.colorScheme.surface),
                switchActiveColor: context.colorScheme.primary,
                onChanged: (value) {
                  provider.changeTheme(value);
                  LocaleStorage.instance
                      .setBoolValue(LocaleKeys.THEME_MODE, value);
                },
                value: provider.isDark!,
                title: Text("Dark Mode",
                    style: TextStyle(
                        color: context.colorScheme.surface,
                        fontWeight: FontWeight.bold)),
              )),
      ProfileListTileBuilder(
        title: "Change Password",
        onTap: () {},
        leading: ImageKeys.edit_business,
      ),
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
      ProfileListTileBuilder(
        title: "Privacy Policy",
        onTap: () => urlAppRouter("https://www.google.com/"),
        leading: ImageKeys.delete_account,
      ),
      ProfileListTileBuilder(
        title: "Rate App",
        onTap: () {},
        leading: ImageKeys.delete_account,
      ),
      ProfileListTileBuilder(
        title: "   Version",
        onTap: () => appVersionDialog(context),
        trailing: Text(
          AppConstants.APP_VERSION,
        ),
        leading: ImageKeys.delete_account,
      ),
      LogOutButton(loginProvider: _loginProvider),
    ]);
  }
}
