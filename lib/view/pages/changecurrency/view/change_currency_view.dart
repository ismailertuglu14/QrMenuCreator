import 'package:flutter/material.dart';
import 'package:qrmenu/product/utility/page_padding.dart';
import 'package:qrmenu/product/widget/app_bar.dart';
import 'package:qrmenu/product/widget/text_field.dart';

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
        padding: PagePadding.allMedium(),
        child: const Column(children: [
          CommonTextField(
              prefixIcon: Icon(Icons.search), hintText: "Search Currency"),
        ]),
      ),
    );
  }
}
