class CreateCategoryResponseModel {
  final CreateCategoryData data;
  final bool isSuccess;
  final int statusCode;
  final List<dynamic> errors;

  CreateCategoryResponseModel({
    required this.data,
    required this.isSuccess,
    required this.statusCode,
    required this.errors,
  });

  factory CreateCategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      CreateCategoryResponseModel(
        data: CreateCategoryData.fromJson(json["data"]),
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

class CreateCategoryData {
  final String restaurantId;
  final String menuId;
  final String name;
  final String image;
  final bool isActive;
  final String id;
  final int v;

  CreateCategoryData({
    required this.restaurantId,
    required this.menuId,
    required this.name,
    required this.image,
    required this.isActive,
    required this.id,
    required this.v,
  });

  factory CreateCategoryData.fromJson(Map<String, dynamic> json) => CreateCategoryData(
        restaurantId: json["restaurantId"],
        menuId: json["menuId"],
        name: json["name"],
        image: json["image"],
        isActive: json["isActive"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "restaurantId": restaurantId,
        "menuId": menuId,
        "name": name,
        "image": image,
        "isActive": isActive,
        "_id": id,
        "__v": v,
      };
}
