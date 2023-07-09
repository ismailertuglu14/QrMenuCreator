import 'package:qrmenu/view/pages/createproduct/model/create_product_response_model.dart';

class UpdateProductResponseModel {
  final UpdateProductData data;
  final bool isSuccess;
  final int statusCode;
  final List<dynamic> errors;

  UpdateProductResponseModel({
    required this.data,
    required this.isSuccess,
    required this.statusCode,
    required this.errors,
  });

  factory UpdateProductResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdateProductResponseModel(
        data: UpdateProductData.fromJson(json["data"]),
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

class UpdateProductData {
  final String id;
  final String restaurantId;
  final String menuId;
  final String categoryId;
  final String name;
  final String description;
  final List<Ingredient> ingredients;
  final List<Nutrition> nutritions;
  final int price;
  final String currency;
  final List<String> images;
  final bool isActive;
  final DateTime createdDate;
  final int v;
  final DateTime updatedDate;

  UpdateProductData({
    required this.id,
    required this.restaurantId,
    required this.menuId,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.ingredients,
    required this.nutritions,
    required this.price,
    required this.currency,
    required this.images,
    required this.isActive,
    required this.createdDate,
    required this.v,
    required this.updatedDate,
  });

  factory UpdateProductData.fromJson(Map<String, dynamic> json) => UpdateProductData(
        id: json["_id"],
        restaurantId: json["restaurantId"],
        menuId: json["menuId"],
        categoryId: json["categoryId"],
        name: json["name"],
        description: json["description"],
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromJson(x))),
        nutritions: List<Nutrition>.from(
            json["nutritions"].map((x) => Nutrition.fromJson(x))),
        price: json["price"],
        currency: json["currency"],
        images: List<String>.from(json["images"].map((x) => x)),
        isActive: json["isActive"],
        createdDate: DateTime.parse(json["createdDate"]),
        v: json["__v"],
        updatedDate: DateTime.parse(json["updatedDate"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "restaurantId": restaurantId,
        "menuId": menuId,
        "categoryId": categoryId,
        "name": name,
        "description": description,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "nutritions": List<dynamic>.from(nutritions.map((x) => x.toJson())),
        "price": price,
        "currency": currency,
        "images": List<dynamic>.from(images.map((x) => x)),
        "isActive": isActive,
        "createdDate": createdDate.toIso8601String(),
        "__v": v,
        "updatedDate": updatedDate.toIso8601String(),
      };
}
