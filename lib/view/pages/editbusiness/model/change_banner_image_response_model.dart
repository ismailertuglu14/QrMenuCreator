class ChangeBannerImageResponseModel {
  ChangeBannerImageResponseModel({
    required this.data,
    required this.statusCode,
    required this.isSuccess,
    required this.errors,
  });

  final String data;
  final int statusCode;
  final bool isSuccess;
  final List<dynamic> errors;

  factory ChangeBannerImageResponseModel.fromJson(Map<String, dynamic> json) =>
      ChangeBannerImageResponseModel(
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
