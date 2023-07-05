class GetCategoriesRequestModel {
  final String menuId;

  GetCategoriesRequestModel({
    required this.menuId,
  });

  factory GetCategoriesRequestModel.fromJson(Map<String, dynamic> json) =>
      GetCategoriesRequestModel(
        menuId: json["menuId"],
      );

  Map<String, dynamic> toJson() => {
        "menuId": menuId,
      };
}
