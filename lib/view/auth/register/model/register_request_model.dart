import 'package:qrmenu/view/auth/login/model/get_business_response_model.dart';

class RegisterRequestModel {
  final String restaurantName;
  final String email;
  final String password;
  final String passwordAgain;
  final Phone phone;

  RegisterRequestModel({
    required this.restaurantName,
    required this.email,
    required this.password,
    required this.passwordAgain,
    required this.phone,
  });

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      RegisterRequestModel(
        restaurantName: json["restaurantName"],
        email: json["email"],
        password: json["password"],
        passwordAgain: json["passwordAgain"],
        phone: Phone.fromJson(json["phone"]),
      );

  Map<String, dynamic> toJson() => {
        "restaurantName": restaurantName,
        "email": email,
        "password": password,
        "passwordAgain": passwordAgain,
        "phone": phone.toJson(),
      };
}
