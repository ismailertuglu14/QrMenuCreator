

class DeleteBusinessRequestModel {
  final String restaurantId;
  final String password;

  DeleteBusinessRequestModel({
    required this.restaurantId,
    required this.password,
  });

  factory DeleteBusinessRequestModel.fromJson(Map<String, dynamic> json) =>
      DeleteBusinessRequestModel(
        restaurantId: json["restaurantId"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "restaurantId": restaurantId,
        "password": password,
      };
}
