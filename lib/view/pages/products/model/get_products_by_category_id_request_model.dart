class GetProductsByCategoyIdRequestModel {
  final String categoryId;

  GetProductsByCategoyIdRequestModel({
    required this.categoryId,
  });

  factory GetProductsByCategoyIdRequestModel.fromJson(Map<String, dynamic> json) =>
      GetProductsByCategoyIdRequestModel(
        categoryId: json["categoryId"],
      );

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
      };
}
