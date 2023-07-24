// ignore_for_file: public_member_api_docs, sort_constructors_first
class GetProductByIdResponseModel {
  final GetProductByIdData data;
  final bool isSuccess;
  final int statusCode;
  final List<dynamic> errors;

  GetProductByIdResponseModel({
    required this.data,
    required this.isSuccess,
    required this.statusCode,
    required this.errors,
  });

  factory GetProductByIdResponseModel.fromJson(Map<String, dynamic> json) =>
      GetProductByIdResponseModel(
        data: GetProductByIdData.fromJson(json["data"]),
        isSuccess: json["isSuccess"],
        statusCode: json["statusCode"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "isSuccess": isSuccess,
        "statusCode": statusCode,
        "errors": List<dynamic>.from(errors.map((x) => x)),
      };
}

class GetProductByIdData {
  final String id;
  final String restaurantId;
  final String menuId;
  final String categoryId;
  final String name;
  final String description;
  final List<Nutrition> nutritions;
  final List<Allergen> allergens;
  final int price;
  final String currency;
  final List<dynamic> images;
  final DateTime createdDate;
  final bool isActive;

  GetProductByIdData({
    required this.id,
    required this.restaurantId,
    required this.menuId,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.nutritions,
    required this.allergens,
    required this.price,
    required this.currency,
    required this.images,
    required this.createdDate,
    required this.isActive,
  });

  factory GetProductByIdData.fromJson(Map<String, dynamic> json) =>
      GetProductByIdData(
        id: json["_id"],
        restaurantId: json["restaurantId"],
        menuId: json["menuId"],
        categoryId: json["categoryId"],
        name: json["name"],
        description: json["description"],
        nutritions: List<Nutrition>.from(
            json["nutritions"].map((x) => Nutrition.fromJson(x))),
        allergens: List<Allergen>.from(
            json["allergens"].map((x) => Allergen.fromJson(x))),
        price: json["price"],
        currency: json["currency"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
        createdDate: DateTime.parse(json["createdDate"]),
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "restaurantId": restaurantId,
        "menuId": menuId,
        "categoryId": categoryId,
        "name": name,
        "description": description,
        "nutritions": List<dynamic>.from(nutritions.map((x) => x.toJson())),
        "allergens": List<dynamic>.from(allergens.map((x) => x.toJson())),
        "price": price,
        "currency": currency,
        "images": List<dynamic>.from(images.map((x) => x)),
        "createdDate": createdDate.toIso8601String(),
        "isActive": isActive,
      };
}

class Allergen {
  String name;
  bool isAllergen;

  Allergen({
    required this.name,
    required this.isAllergen,
  });

  factory Allergen.fromJson(Map<String, dynamic> json) => Allergen(
        name: json["name"],
        isAllergen: json["isAllergen"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "isAllergen": isAllergen,
      };
}

class AddOns {
  String name;
  int price;
  String description;
  AddOns({
    required this.name,
    required this.price,
    required this.description,
  });
}

class Nutrition {
  final String name;
  final int value;

  Nutrition({
    required this.name,
    required this.value,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) => Nutrition(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}
