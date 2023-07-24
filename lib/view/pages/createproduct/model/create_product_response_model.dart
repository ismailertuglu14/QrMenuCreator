import 'get_product_by_id_response_model.dart';

class CreateProductResponseModel {
  final CreateProductData data;
  final bool isSuccess;
  final int statusCode;
  final List<dynamic> errors;

  CreateProductResponseModel({
    required this.data,
    required this.isSuccess,
    required this.statusCode,
    required this.errors,
  });

  factory CreateProductResponseModel.fromJson(Map<String, dynamic> json) =>
      CreateProductResponseModel(
        data: CreateProductData.fromJson(json["data"]),
        isSuccess: json["isSuccess"],
        statusCode: json["statusCode"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "isSuccess": isSuccess,
        "statusCode": statusCode,
        "errors": List<String>.from(errors.map((x) => x)),
      };
}

class CreateProductData {
  final String restaurantId;
  final String menuId;
  final String categoryId;
  final String name;
  final String description;
  final List<Nutrition> nutritions;
  final List<Allergen> allergens;
  final int price;
  final String currency;
  final List<String> images;
  final DateTime createdDate;
  final bool isActive;
  final String id;
  final int v;

  CreateProductData({
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
    required this.id,
    required this.v,
  });

  factory CreateProductData.fromJson(Map<String, dynamic> json) =>
      CreateProductData(
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
        images: List<String>.from(json["images"].map((x) => x)),
        createdDate: DateTime.parse(json["createdDate"]),
        isActive: json["isActive"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
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
        "_id": id,
        "__v": v,
      };
}

