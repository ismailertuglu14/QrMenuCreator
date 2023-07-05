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
        data: List<RestaurantMenuData>.from(json["data"].map((x) => RestaurantMenuData.fromJson(x))),
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
  final String restaurantId;
  final int templateId;
  final String name;
  final int v;

  RestaurantMenuData({
    required this.id,
    required this.restaurantId,
    required this.templateId,
    required this.name,
    required this.v,
  });

  factory RestaurantMenuData.fromJson(Map<String, dynamic> json) => RestaurantMenuData(
        id: json["_id"],
        restaurantId: json["restaurantId"],
        templateId: json["templateId"],
        name: json["name"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "restaurantId": restaurantId,
        "templateId": templateId,
        "name": name,
        "__v": v,
      };
}
