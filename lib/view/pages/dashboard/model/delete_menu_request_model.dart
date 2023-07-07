class DeleteMenuRequestModel {
  final String menuId;

  DeleteMenuRequestModel({
    required this.menuId,
  });

  factory DeleteMenuRequestModel.fromJson(Map<String, dynamic> json) =>
      DeleteMenuRequestModel(
        menuId: json["menuId"],
      );

  Map<String, dynamic> toJson() => {
        "menuId": menuId,
      };
}
