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
  List<CurrencyModel> _currencyListForSearch = [];

  List<CurrencyModel> get currencyList => _currencyList;
  List<CurrencyModel> get currencyListForSearch => _currencyListForSearch;

  void addCurrency(CurrencyModel value) {
    _currencyList.add(value);
    notifyListeners();
  }

  void searchCurrency(String keyword) {
    if (keyword.isEmpty) {
      _currencyListForSearch = _currencyList;
    } else {
      _currencyListForSearch = _currencyList
          .where((item) =>
              item.currency.toLowerCase().contains(keyword.toLowerCase()) ||
              item.abbreviation.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
