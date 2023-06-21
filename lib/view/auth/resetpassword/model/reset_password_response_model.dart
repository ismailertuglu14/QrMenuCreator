class ResetPasswordResponseModel {
  String? data;
  int statusCode;
  bool isSuccess;
  List<dynamic> errors;

  ResetPasswordResponseModel({
    required this.data,
    required this.statusCode,
    required this.isSuccess,
    required this.errors,
  });

  factory ResetPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      ResetPasswordResponseModel(
        data: json["data"],
        statusCode: json["statusCode"],
        isSuccess: json["isSuccess"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "statusCode": statusCode,
        "isSuccess": isSuccess,
        "errors": List<dynamic>.from(errors.map((x) => x)),
      };
}
