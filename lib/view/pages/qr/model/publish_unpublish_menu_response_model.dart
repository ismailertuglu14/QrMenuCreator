class PublishUnpublishMenuResponseModel {
  PublishUnpublishMenuResponseModel({
    required this.data,
    required this.statusCode,
    required this.isSuccess,
    required this.errors,
  });

  final dynamic data;
  final int statusCode;
  final bool isSuccess;
  final List<dynamic> errors;

  factory PublishUnpublishMenuResponseModel.fromJson(
          Map<String, dynamic> json) =>
      PublishUnpublishMenuResponseModel(
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
