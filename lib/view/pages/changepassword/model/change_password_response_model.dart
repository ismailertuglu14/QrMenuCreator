class ChangePasswordResponseModel {
  final dynamic data;
  final bool isSuccess;
  final int statusCode;
  final List<dynamic> errors;

  ChangePasswordResponseModel({
    required this.data,
    required this.isSuccess,
    required this.statusCode,
    required this.errors,
  });

  factory ChangePasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      ChangePasswordResponseModel(
        data: json["data"],
        isSuccess: json["isSuccess"],
        statusCode: json["statusCode"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "isSuccess": isSuccess,
        "statusCode": statusCode,
        "errors": List<dynamic>.from(errors.map((x) => x)),
      };
}
