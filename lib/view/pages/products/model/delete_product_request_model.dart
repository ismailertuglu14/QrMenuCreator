class DeleteProductRequestModel {
  final String productId;

  DeleteProductRequestModel({
    required this.productId,
  });

  factory DeleteProductRequestModel.fromJson(Map<String, dynamic> json) =>
      DeleteProductRequestModel(
        productId: json["productId"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
      };
}
