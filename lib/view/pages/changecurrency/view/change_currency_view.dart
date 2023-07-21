import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/init/provider/edit_business_provider.dart';
import 'package:qrmenu/product/utility/page_padding.dart';
import 'package:qrmenu/product/widget/app_bar.dart';
import 'package:qrmenu/product/widget/text_field.dart';

import '../../../../core/init/provider/change_currency_provider.dart';
import '../../../../product/widget/close_keyboard.dart';
import '../model/currencys_model.dart';

part '../viewmodel/change_currency_view_model.dart';

class ChangeCurrencyView extends StatefulWidget {
  const ChangeCurrencyView({super.key});

  @override
  State<ChangeCurrencyView> createState() => _ChangeCurrencyViewState();
}

class _ChangeCurrencyViewState extends ChangeCurrencyViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: Text('Change Currency')),
      body: CloseKeyboard(
        child: Padding(
          padding: PagePadding.allDefault(),
          child: Column(children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: CommonTextField(
                  onChanged: _changeCurrencyProvider.searchCurrency,
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search Currency"),
            ),
            Flexible(
              flex: 9,
              fit: FlexFit.loose,
              child: Consumer2<ChangeCurrencyProvider, EditBusinessProvider>(
                  builder: (context, currencyProvider, editBusinessProvider,
                          child) =>
                      ListView.builder(
                        itemCount:
                            currencyProvider.currencyListForSearch.length,
                        itemBuilder: (context, index) => ListTile(
                            onTap: () => editBusinessProvider.changeCurrentCurrency(
                                currencyProvider
                                    .currencyListForSearch[index].abbreviation),
                            trailing: editBusinessProvider.currentCurrency ==
                                    currencyProvider
                                        .currencyListForSearch[index]
                                        .abbreviation
                                ? Icon(Icons.check_rounded)
                                : null,
                            title: Text(currencyProvider
                                .currencyListForSearch[index].currency),
                            leading: Text(currencyProvider
                                .currencyListForSearch[index].abbreviation)),
                      )),
            )
          ]),
        ),
      ),
    );
  }
}
