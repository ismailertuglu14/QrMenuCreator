import 'package:flutter/material.dart';
import 'package:qrmenu/view/pages/changecurrency/model/currencys_model.dart';

class ChangeCurrencyProvider extends ChangeNotifier {
  static ChangeCurrencyProvider? _instance;

  static ChangeCurrencyProvider get instance {
    _instance ??= ChangeCurrencyProvider._();
    return _instance!;
  }

  ChangeCurrencyProvider._();

  final List<CurrencyModel> _currencyList = [];

  List<CurrencyModel> get currencyList => _currencyList;

  void addCurrency(CurrencyModel value) {
    _currencyList.add(value);
    notifyListeners();
  }

 
}
