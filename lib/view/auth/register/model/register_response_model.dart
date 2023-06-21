class RegisterResponseModel {
  RegisterResponseModel({
    required this.data,
    required this.statusCode,
    required this.isSuccess,
    required this.errors,
  });

  final Data data;
  final int statusCode;
  final bool isSuccess;
  final List<dynamic> errors;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModel(
        data: Data.fromJson(json["data"]),
        statusCode: json["statusCode"],
        isSuccess: json["isSuccess"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "statusCode": statusCode,
        "isSuccess": isSuccess,
        "errors": List<dynamic>.from(errors.map((x) => x)),
      };
}

class Data {
  Data({
    required this.accessToken,
    required this.refreshToken,
    required this.expiredAt,
  });

  final String accessToken;
  final String refreshToken;
  final DateTime expiredAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        expiredAt: DateTime.parse(json["expiredAt"]),
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "expiredAt": expiredAt.toIso8601String(),
      };
}
