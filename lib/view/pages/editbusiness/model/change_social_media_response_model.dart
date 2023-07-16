import '../../../auth/login/model/get_business_response_model.dart';

class ChangeSocialMediaResponseModel {
  final SocialMedias data;
  final bool isSuccess;
  final int statusCode;
  final List<dynamic> errors;

  ChangeSocialMediaResponseModel({
    required this.data,
    required this.isSuccess,
    required this.statusCode,
    required this.errors,
  });

  factory ChangeSocialMediaResponseModel.fromJson(Map<String, dynamic> json) =>
      ChangeSocialMediaResponseModel(
        data: SocialMedias.fromJson(json["data"]),
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
