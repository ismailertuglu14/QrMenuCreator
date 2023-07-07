class DeleteCategoryResponseModel {
  final dynamic data;
  final bool isSuccess;
  final int statusCode;
  final List<dynamic> errors;

  DeleteCategoryResponseModel({
    required this.data,
    required this.isSuccess,
    required this.statusCode,
    required this.errors,
  });

  factory DeleteCategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      DeleteCategoryResponseModel(
        data: json["data"],
        isSuccess: json["isSuccess"],
        statusCode: json["statusCode"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "isSuccess": isSuccess,
        "statusCode": statusCode,
        "errors": errors.map((x) => x.toJson()).toList(),
      };
}
