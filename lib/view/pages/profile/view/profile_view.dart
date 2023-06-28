import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
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
import '../../../../core/init/provider/theme_provider.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/elevation_button.dart';
import '../../../../product/widget/email_app_router.dart';

part '../viewmodel/profile_view_model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ProfileViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Flexible(
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
        Flexible(
          child: Padding(
            padding: PagePadding.allMedium(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Ercan Burger",
                    style: TextStyle(
                        fontSize: context.text.headlineSmall?.fontSize,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "ercanburger@gmail.com",
                    style:
                        TextStyle(fontSize: context.text.titleMedium?.fontSize),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "Current Plan",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: context.text.titleMedium?.fontSize),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        SubscriptionPlanKeys.Basic.name,
                        style: TextStyle(
                            fontSize: context.text.titleMedium?.fontSize),
                      ),
                      CommonElevationButton(
                        child: Row(
                          children: [
                            ImageKeys.premium
                                .imageAsset(width: context.width / 10),
                            Padding(
                              padding: PagePadding.allLow(),
                              child: Text(
                                "Upgrade plan",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        onPressed: () => _homeProvider.changeCurrentIndex(
                            BottomNaviBarKeys.Subscription.index),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        ProfileListTileBuilder(
            title: "Edit Profile",
            onTap: () => context.push(RouterKeys.EDIT_PROFILE.route),
            leading: Icon(Icons.edit_outlined)),
        ProfileListTileBuilder(
          leading: Icon(Icons.color_lens_outlined),
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
          leading: Icon(Icons.language_rounded),
          onTap: () {},
        ),
        ProfileListTileBuilder(
          title: "Contact Us",
          onTap: () => emailAppRouter(),
          leading: Icon(Icons.email_outlined),
        ),
        ProfileListTileBuilder(
          title: "App Feedback",
          onTap: () => Wiredash.of(context).show(inheritMaterialTheme: true),
          leading: Icon(Icons.feedback_outlined),
        ),
        ProfileListTileBuilder(
          title: "Delete Account",
          onTap: () {},
          leading: Icon(Icons.delete_outline_outlined),
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
                                              onPressed: () => context
                                                  .go(RouterKeys.LOGIN.route),
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
            secondary: image.imageAsset(width: context.width * 0.1),
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
    this.leading,
    this.trailing,
    this.onTap,
  });
  final String title;
  final Widget? leading;
  final Widget? trailing;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
      leading: leading,
      trailing: trailing,
    );
  }
}
