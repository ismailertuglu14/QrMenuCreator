

class GetProductsByMenuIdResponseModel {
  final List<GetProductsByMenuIdData> data;
  final bool isSuccess;
  final int statusCode;
  final List<dynamic> errors;

  GetProductsByMenuIdResponseModel({
    required this.data,
    required this.isSuccess,
    required this.statusCode,
    required this.errors,
  });

  factory GetProductsByMenuIdResponseModel.fromJson(
          Map<String, dynamic> json) =>
      GetProductsByMenuIdResponseModel(
        data: List<GetProductsByMenuIdData>.from(json["data"].map((x) => GetProductsByMenuIdData.fromJson(x))),
        isSuccess: json["isSuccess"],
        statusCode: json["statusCode"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "isSuccess": isSuccess,
        "statusCode": statusCode,
        "errors": List<dynamic>.from(errors.map((x) => x)),
      };
}

class GetProductsByMenuIdData {
  final String id;
  final String name;
  final String description;
  final List<String> image;
  final int price;
  final String currency;
  final bool isNew;

  GetProductsByMenuIdData({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.currency,
    required this.isNew,
  });

  factory GetProductsByMenuIdData.fromJson(Map<String, dynamic> json) => GetProductsByMenuIdData(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: List<String>.from(json["image"].map((x) => x)),
        price: json["price"],
        currency: json["currency"],
        isNew: json["isNew"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": List<dynamic>.from(image.map((x) => x)),
        "price": price,
        "currency": currency,
        "isNew": isNew,
      };
}
