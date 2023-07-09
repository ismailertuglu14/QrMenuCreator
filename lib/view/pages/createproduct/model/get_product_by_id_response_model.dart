import 'package:qrmenu/view/pages/createproduct/model/create_product_response_model.dart';

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
  final List<Ingredient> ingredients;
  final List<Nutrition> nutritions;
  final int price;
  final String currency;
  final List<String> images;
  final DateTime createdDate;
  final DateTime updatedDate;

  GetProductByIdData({
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
    required this.createdDate,
    required this.updatedDate,
  });

  factory GetProductByIdData.fromJson(Map<String, dynamic> json) =>
      GetProductByIdData(
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
        createdDate: DateTime.parse(json["createdDate"]),
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
        "createdDate": createdDate.toIso8601String(),
        "updatedDate": updatedDate.toIso8601String(),
      };
}
