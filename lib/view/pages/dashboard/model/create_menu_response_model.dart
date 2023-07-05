import 'get_restaurant_menus_response_model.dart';

class CreateMenuResponseModel {
  final RestaurantMenuData data;
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
        data: RestaurantMenuData.fromJson(json["data"]),
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
