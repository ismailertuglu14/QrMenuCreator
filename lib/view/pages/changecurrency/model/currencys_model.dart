class CurrencyModel {
  final String currency;
  final String abbreviation;
  

  CurrencyModel({
    required this.currency,
    required this.abbreviation,

  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        currency: json["currency"],
        abbreviation: json["abbreviation"],
      
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "abbreviation": abbreviation,
       
      };
}
