class CheckUpdateResponseModel {
  final Data data;
  final int statusCode;
  final bool isSuccess;
  final List<dynamic> errors;

  CheckUpdateResponseModel({
    required this.data,
    required this.statusCode,
    required this.isSuccess,
    required this.errors,
  });

  factory CheckUpdateResponseModel.fromJson(Map<String, dynamic> json) =>
      CheckUpdateResponseModel(
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
  final String appleId;
  final String playStoreId;
  final bool isRequired;

  Data({
    required this.appleId,
    required this.playStoreId,
    required this.isRequired,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        appleId: json["appleId"],
        playStoreId: json["playStoreId"],
        isRequired: json["isRequired"],
      );

  Map<String, dynamic> toJson() => {
        "appleId": appleId,
        "playStoreId": playStoreId,
        "isRequired": isRequired,
      };
}
