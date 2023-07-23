import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/init/provider/change_language_provider.dart';
import 'package:qrmenu/product/widget/app_bar.dart';

import '../../../../core/constans/cache/locale_keys_enum.dart';
import '../../../../core/init/cache/local_storage.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/close_keyboard.dart';
import '../../../../product/widget/countrycodepicker/country_code.dart';
import '../../../../product/widget/countrycodepicker/country_codes.dart';
import '../../../../product/widget/text_field.dart';
import '../widget/language_tile_builder.dart';

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
        body: CloseKeyboard(
          child: Padding(
            padding: PagePadding.allDefault(),
            child: Consumer<ChangeLanguageProvider>(
                builder: (context, provider, child) => ListView.custom(
                      childrenDelegate: SliverChildListDelegate([
                        LanguageTileBuilder(
                            flagUri: "us", countryName: "English"),
                        LanguageTileBuilder(
                            flagUri: "es", countryName: "Spanish"),
                        LanguageTileBuilder(
                            flagUri: "cn", countryName: "Chinese"),
                        LanguageTileBuilder(
                            flagUri: "ru", countryName: "Russian"),
                        LanguageTileBuilder(
                            flagUri: "in", countryName: "Hindi"),
                        LanguageTileBuilder(
                            flagUri: "tr", countryName: "Turkish"),
                      ]),
                    )),
          ),
        ));
  }
}
