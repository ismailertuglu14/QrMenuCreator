class GetRestaurantMenusResponseModel {
  final List<RestaurantMenuData> data;
  final bool isSuccess;
  final int statusCode;
  final List<dynamic> errors;

  GetRestaurantMenusResponseModel({
    required this.data,
    required this.isSuccess,
    required this.statusCode,
    required this.errors,
  });

  factory GetRestaurantMenusResponseModel.fromJson(Map<String, dynamic> json) =>
      GetRestaurantMenusResponseModel(
        data: List<RestaurantMenuData>.from(
            json["data"].map((x) => RestaurantMenuData.fromJson(x))),
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

class RestaurantMenuData {
  final String id;
  final String name;
  final int templateId;
  final String restaurantId;
  final int productCount;
  final int categoryCount;
  final String? coverImage;

  RestaurantMenuData({
    required this.id,
    required this.name,
    required this.templateId,
    required this.restaurantId,
    required this.productCount,
    required this.categoryCount,
    required this.coverImage,
  });

  factory RestaurantMenuData.fromJson(Map<String, dynamic> json) =>
      RestaurantMenuData(
        id: json["_id"],
        name: json["name"],
        templateId: json["templateId"],
        restaurantId: json["restaurantId"],
        productCount: json["productCount"],
        categoryCount: json["categoryCount"],
        coverImage: json["coverImage"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "templateId": templateId,
        "restaurantId": restaurantId,
        "productCount": productCount,
        "categoryCount": categoryCount,
        "coverImage": coverImage,
      };
}
