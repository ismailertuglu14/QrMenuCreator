import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/init/provider/change_language_provider.dart';
import 'package:qrmenu/product/widget/app_bar.dart';

import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/countrycodepicker/country_code.dart';
import '../../../../product/widget/countrycodepicker/country_codes.dart';
import '../../../../product/widget/text_field.dart';

part '../viewmodel/change_language_view_model.dart';

class ChangeLanguageView extends StatefulWidget {
  const ChangeLanguageView({super.key});

  @override
  State<ChangeLanguageView> createState() => _ChangeLanguageViewState();
}

class _ChangeLanguageViewState extends ChangeLanguageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CommonAppBar(title: Text("Change Language")),
        body: Padding(
          padding: PagePadding.allLow(),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Expanded(
                flex: 1,
                child: Consumer<ChangeLanguageProvider>(
                  builder: (context, provider, child) => CommonTextField(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search Language",
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.search,
                    onChanged: provider.searchCountry,
                  ),
                )),
            Expanded(
              flex: 9,
              child: Container(
                constraints: BoxConstraints(maxHeight: context.height / 2),
                child: Scrollbar(
                  child: Consumer<ChangeLanguageProvider>(
                    builder: (context, provider, child) => ListView.builder(
                        itemCount: provider.localCountryCodes.length,
                        itemBuilder: (context, index) => ListTile(
                              leading: ClipRRect(
                                clipBehavior: Clip.hardEdge,
                                borderRadius: PageBorderRadius.allMin(),
                                child: Image.asset(
                                  provider.allCountryCodes![index].flagUri!,
                                  width: context.width / 10,
                                ),
                              ),
                              trailing: provider.selectedCountryName ==
                                      provider.allCountryCodes![index].name
                                  ? Icon(
                                      Icons.check,
                                      color: context.colorScheme.primary,
                                    )
                                  : null,
                              title:
                                  Text(provider.allCountryCodes![index].name!),
                              onTap: () => provider.selectCountry(
                                provider.allCountryCodes![index].name,
                                index,
                              ),
                            )),
                  ),
                ),
              ),
            )
          ]),
        ));
  }
}
