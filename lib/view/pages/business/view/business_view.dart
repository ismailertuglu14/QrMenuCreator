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
      body: Column(children: [
        Expanded(
          flex: 1,
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Positioned(
                  top: 0,
                  height: context.height * 0.15,
                  width: context.width,
                  child:
                      ImageKeys.default_banner.imageAsset(fit: BoxFit.cover)),
              Positioned(
                top: context.height * 0.1,
                child: UserCircleAvatar(
                  maxRadius: 50,
                  backgroundImage: ImageKeys.default_cover.assetImage(),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
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
          onTap: () {
            showModalBottomSheet(
                showDragHandle: true,
                context: context,
                builder: (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        settingsThemeSwitchBuilder(context, "System",
                            ThemeModekeys.SYSTEM, ImageKeys.system_theme),
                        settingsThemeSwitchBuilder(context, "Light",
                            ThemeModekeys.LIGHT, ImageKeys.light_theme),
                        settingsThemeSwitchBuilder(context, "Dark",
                            ThemeModekeys.DARK, ImageKeys.dark_theme),
                      ],
                    ));
          },
        ),
        ProfileListTileBuilder(
          title: "Language",
          leading: ImageKeys.language,
          onTap: () {},
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
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: PagePadding.allMedium(),
                child: OutlinedButton(
                  style: ButtonStyle(
                      side: MaterialStateProperty.all(
                          BorderSide(color: context.colorScheme.error)),
                      foregroundColor:
                          MaterialStateProperty.all(context.colorScheme.error)),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => Dialog(
                              child: Padding(
                                padding: PagePadding.allMedium(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Are you sure to logout?",
                                        style: TextStyle(
                                            fontSize: context
                                                .text.titleMedium?.fontSize)),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CommonElevationButton(
                                              onPressed: () => context.pop(),
                                              child: Text("No")),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: OutlinedButton(
                                              onPressed: () {
                                                _loginProvider.logout();
                                                context
                                                    .go(RouterKeys.LOGIN.route);
                                              },
                                              child: Text("Yes")),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ));
                  },
                  child: Padding(
                    padding: PagePadding.allMedium(),
                    child: Text("Log Out"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

settingsThemeSwitchBuilder(
    BuildContext context, String title, ThemeModekeys value, ImageKeys image) {
  return Consumer<ThemeProvider>(
      builder: (context, provider, child) => RadioListTile(
            secondary: image.imageAsset(width: context.width / 10),
            controlAffinity: ListTileControlAffinity.trailing,
            groupValue: provider.themeMode,
            title: Text(title,
                style: TextStyle(color: context.colorScheme.surface)),
            value: ThemeModekeys.values[value.index],
            onChanged: (theme) {
              provider.changeTheme(theme!);
              LocaleStorage.instance
                  .setIntValue(LocaleKeys.THEME_MODE, theme.index);
            },
          ));
}

class ProfileListTileBuilder extends StatelessWidget {
  const ProfileListTileBuilder({
    super.key,
    required this.title,
    required this.leading,
    this.trailing,
    this.onTap,
  });
  final String title;
  final ImageKeys leading;
  final Widget? trailing;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
      leading: leading.imageIcon(color: context.colorScheme.surface),
      trailing: trailing,
    );
  }
}
