class RelocateCategoryResponseModel {
  final dynamic data;
  final bool isSuccess;
  final int statusCode;
  final List<dynamic> errors;

  RelocateCategoryResponseModel({
    required this.data,
    required this.isSuccess,
    required this.statusCode,
    required this.errors,
  });

  factory RelocateCategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      RelocateCategoryResponseModel(
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
