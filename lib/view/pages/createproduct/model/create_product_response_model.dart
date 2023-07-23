// ignore_for_file: public_member_api_docs, sort_constructors_first
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
        "errors": List<dynamic>.from(errors.map((x) => x)),
      };
}

class CreateProductData {
  final String restaurantId;
  final String menuId;
  final String categoryId;
  final String name;
  final String description;
  final List<Ingredient> ingredients;
  final List<Nutrition> nutritions;
  final List<Allergens> allergens;
  final int price;
  final String currency;
  final List<dynamic> images;
  final bool isActive;
  final DateTime createdDate;
  final String id;
  final int v;

  CreateProductData({
    required this.restaurantId,
    required this.menuId,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.ingredients,
    required this.nutritions,
    required this.allergens,
    required this.price,
    required this.currency,
    required this.images,
    required this.isActive,
    required this.createdDate,
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
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromJson(x))),
        nutritions: List<Nutrition>.from(
            json["nutritions"].map((x) => Nutrition.fromJson(x))),
        price: json["price"],
        currency: json["currency"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
        isActive: json["isActive"],
        createdDate: DateTime.parse(json["createdDate"]),
        id: json["_id"],
        v: json["__v"],
        allergens: List<Allergens>.from(
            json["allergens"].map((x) => Allergens.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
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
        "allergens": List<dynamic>.from(allergens.map((x) => x.toJson())),
        "_id": id,
        "__v": v,
      };
}

class Allergens {
  String name;
  bool isAllergen;
  Allergens({
    required this.name,
    required this.isAllergen,
  });

  factory Allergens.fromJson(Map<String, dynamic> json) => Allergens(
        name: json["name"],
        isAllergen: json["isAllergen"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "isAllergen": isAllergen,
      };
}

class Ingredient {
  final String name;
  final bool isInclude;

  Ingredient({
    required this.name,
    required this.isInclude,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        name: json["name"],
        isInclude: json["isInclude"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "isInclude": isInclude,
      };
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
