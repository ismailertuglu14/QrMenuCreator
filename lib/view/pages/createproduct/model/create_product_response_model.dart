

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
  final List<ProductIngredient> ingredients;
  final int price;
  final String currency;
  final List<String> images;
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
    required this.price,
    required this.currency,
    required this.images,
    required this.isActive,
    required this.createdDate,
    required this.id,
    required this.v,
  });

  factory CreateProductData.fromJson(Map<String, dynamic> json) => CreateProductData(
        restaurantId: json["restaurantId"],
        menuId: json["menuId"],
        categoryId: json["categoryId"],
        name: json["name"],
        description: json["description"],
        ingredients: List<ProductIngredient>.from(
            json["ingredients"].map((x) => ProductIngredient.fromJson(x))),
        price: json["price"],
        currency: json["currency"],
        images: List<String>.from(json["images"].map((x) => x)),
        isActive: json["isActive"],
        createdDate: DateTime.parse(json["createdDate"]),
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "restaurantId": restaurantId,
        "menuId": menuId,
        "categoryId": categoryId,
        "name": name,
        "description": description,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "price": price,
        "currency": currency,
        "images": List<dynamic>.from(images.map((x) => x)),
        "isActive": isActive,
        "createdDate": createdDate.toIso8601String(),
        "_id": id,
        "__v": v,
      };
}

class ProductIngredient {
  final String name;
  final bool isInclude;

  ProductIngredient({
    required this.name,
    required this.isInclude,
  });

  factory ProductIngredient.fromJson(Map<String, dynamic> json) => ProductIngredient(
        name: json["name"],
        isInclude: json["isInclude"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "isInclude": isInclude,
      };
}
