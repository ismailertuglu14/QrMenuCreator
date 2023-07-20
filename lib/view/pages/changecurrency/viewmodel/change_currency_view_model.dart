part of '../view/change_currency_view.dart';

abstract class ChangeCurrencyViewModel extends State<ChangeCurrencyView> {
  late final ChangeCurrencyProvider _changeCurrencyProvider;
  late final EditBusinessProvider _editBusinessProvider;

  @override
  void initState() {
    super.initState();
    _changeCurrencyProvider = ChangeCurrencyProvider.instance;
    _editBusinessProvider = EditBusinessProvider.instance;

   
    parseJsonData();
  }

  void parseJsonData() async {
    String jsonData =
        await rootBundle.loadString('assets/currencys/currencys.json');

    List<dynamic> decodedJson = jsonDecode(jsonData);

    for (var item in decodedJson) {
      CurrencyModel currency = CurrencyModel.fromJson(item);
      _changeCurrencyProvider.addCurrency(currency);
    }
  }

  
}
