class RelocateCategoryRequestModel {
  final String categoryId;
  final int newPosition;

  RelocateCategoryRequestModel({
    required this.categoryId,
    required this.newPosition,
  });

  factory RelocateCategoryRequestModel.fromJson(Map<String, dynamic> json) =>
      RelocateCategoryRequestModel(
        categoryId: json["categoryId"],
        newPosition: json["newPosition"],
      );

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "newPosition": newPosition,
      };
}
