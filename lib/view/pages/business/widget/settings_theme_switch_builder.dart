import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/image_icon_extenison.dart';

import '../../../../core/constans/cache/locale_keys_enum.dart';
import '../../../../core/constans/enum/image_keys.dart';
import '../../../../core/constans/enum/theme_mode_keys.dart';
import '../../../../core/init/cache/local_storage.dart';
import '../../../../core/init/provider/theme_provider.dart';

settingsThemeSwitchBuilder(
    BuildContext context, String title, ThemeModekeys value) {
  return Consumer<ThemeProvider>(
      builder: (context, provider, child) => RadioListTile(
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
