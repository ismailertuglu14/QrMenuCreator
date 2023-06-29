class LoginResponseModel {
  final Data data;
  final bool isSuccess;
  final int statusCode;
  final List<dynamic> errors;

  LoginResponseModel({
    required this.data,
    required this.isSuccess,
    required this.statusCode,
    required this.errors,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        data: Data.fromJson(json["data"]),
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

class Data {
  final String accessToken;
  final DateTime expiration;
  final String refreshToken;

  Data({
    required this.accessToken,
    required this.expiration,
    required this.refreshToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["accessToken"],
        expiration: DateTime.parse(json["expiration"]),
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "expiration": expiration.toIso8601String(),
        "refreshToken": refreshToken,
      };
}
