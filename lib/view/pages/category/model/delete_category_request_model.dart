class DeleteCategoryRequestModel {
  final String categoryId;

  DeleteCategoryRequestModel({
    required this.categoryId,
  });

  factory DeleteCategoryRequestModel.fromJson(Map<String, dynamic> json) =>
      DeleteCategoryRequestModel(
        categoryId: json["categoryId"],
      );

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
      };
}
