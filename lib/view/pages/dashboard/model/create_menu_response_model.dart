class CreateMenuResponseModel {
  final CreateMenuData data;
  final bool isSuccess;
  final int statusCode;
  final List<dynamic> errors;

  CreateMenuResponseModel({
    required this.data,
    required this.isSuccess,
    required this.statusCode,
    required this.errors,
  });

  factory CreateMenuResponseModel.fromJson(Map<String, dynamic> json) =>
      CreateMenuResponseModel(
        data: CreateMenuData.fromJson(json["data"]),
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

class CreateMenuData {
  final String restaurantId;
  final int templateId;
  final String name;

  final String coverImage;
  final String id;

  CreateMenuData({
    required this.restaurantId,
    required this.templateId,
    required this.name,
    required this.coverImage,
    required this.id,
  });

  factory CreateMenuData.fromJson(Map<String, dynamic> json) => CreateMenuData(
        restaurantId: json["restaurantId"],
        templateId: json["templateId"],
        name: json["name"],
        coverImage: json["coverImage"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "restaurantId": restaurantId,
        "templateId": templateId,
        "name": name,
        "_id": id,
        "coverImage": coverImage,
      };
}
