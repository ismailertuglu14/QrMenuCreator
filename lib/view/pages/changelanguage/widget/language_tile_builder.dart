import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/context_extension.dart';

import '../../../../core/init/provider/change_language_provider.dart';
import '../../../../product/utility/border_radius.dart';

class LanguageTileBuilder extends StatelessWidget {
  const LanguageTileBuilder({
    super.key,
    required this.flagUri,
    required this.countryName,
  });
  final String flagUri;
  final String countryName;
  @override
  Widget build(BuildContext context) {
    return Consumer<ChangeLanguageProvider>(
      builder: (context, provider, child) => ListTile(
        leading: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: PageBorderRadius.allMin(),
          child: Image.asset("assets/images/flags/$flagUri.png",
              width: context.width / 10),
        ),
        trailing: provider.selectedCountryName == countryName
            ? Icon(
                Icons.check,
                color: context.colorScheme.primary,
              )
            : null,
        title: Text(countryName),
        onTap: () => provider.selectCountry(countryName),
      ),
    );
  }
}
