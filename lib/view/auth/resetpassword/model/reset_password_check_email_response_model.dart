class ResetPasswordCheckEmailResponseModel {
  final dynamic data;
  final int statusCode;
  final bool isSuccess;
  final List<String> errors;

  ResetPasswordCheckEmailResponseModel({
    this.data,
    required this.statusCode,
    required this.isSuccess,
    required this.errors,
  });

  factory ResetPasswordCheckEmailResponseModel.fromJson(
          Map<String, dynamic> json) =>
      ResetPasswordCheckEmailResponseModel(
        data: json["data"],
        statusCode: json["statusCode"],
        isSuccess: json["isSuccess"],
        errors: List<String>.from(json["errors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "statusCode": statusCode,
        "isSuccess": isSuccess,
        "errors": List<dynamic>.from(errors.map((x) => x)),
      };
}
