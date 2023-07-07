

class GetCategoriesResponseModel {
  final List<GetCategoriesData> data;
  final bool isSuccess;
  final int statusCode;
  final List<dynamic> errors;

  GetCategoriesResponseModel({
    required this.data,
    required this.isSuccess,
    required this.statusCode,
    required this.errors,
  });

  factory GetCategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      GetCategoriesResponseModel(
        data: List<GetCategoriesData>.from(json["data"].map((x) => GetCategoriesData.fromJson(x))),
        isSuccess: json["isSuccess"],
        statusCode: json["statusCode"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "isSuccess": isSuccess,
        "statusCode": statusCode,
        "errors": List<dynamic>.from(errors.map((x) => x)),
      };
}

class GetCategoriesData {
  final String id;
  final String name;
  final String? image;
  final int productCount;

  GetCategoriesData({
    required this.id,
    required this.name,
    required this.image,
    required this.productCount,
  });

  factory GetCategoriesData.fromJson(Map<String, dynamic> json) => GetCategoriesData(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
        productCount: json["productCount"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "image": image,
        "productCount": productCount,
      };
}
