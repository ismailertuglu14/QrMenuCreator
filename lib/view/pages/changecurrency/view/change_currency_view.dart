import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/init/provider/edit_business_provider.dart';
import 'package:qrmenu/product/utility/page_padding.dart';
import 'package:qrmenu/product/widget/app_bar.dart';
import 'package:qrmenu/product/widget/text_field.dart';

import '../../../../core/init/provider/change_currency_provider.dart';
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
      body: Padding(
        padding: PagePadding.allDefault(),
        child: Column(children: [
          Flexible(
            flex: 1,
            child: CommonTextField(
                prefixIcon: Icon(Icons.search), hintText: "Search Currency"),
          ),
          Flexible(
            flex: 9,
            child: Consumer2<ChangeCurrencyProvider, EditBusinessProvider>(
                builder:
                    (context, currencyProvider, editBusinessProvider, child) =>
                        ListView.builder(
                          itemCount: currencyProvider.currencyList.length,
                          itemBuilder: (context, index) => ListTile(
                              onTap: () => editBusinessProvider
                                  .changeCurrentCurrency(currencyProvider
                                      .currencyList[index].abbreviation),
                              trailing: editBusinessProvider.currentCurrency ==
                                      currencyProvider
                                          .currencyList[index].abbreviation
                                  ? Icon(Icons.check_rounded)
                                  : null,
                              title: Text(currencyProvider
                                  .currencyList[index].currency),
                              leading: Text(
                                  currencyProvider.currencyList[index].abbreviation)),
                        )),
          )
        ]),
      ),
    );
  }
}
