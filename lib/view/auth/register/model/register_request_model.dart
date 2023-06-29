

class RegisterRequestModel {
  final String restaurantName;
  final String email;
  final String password;
  final String passwordAgain;
  final RegisterPhone phone;

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
        phone: RegisterPhone.fromJson(json["phone"]),
      );

  Map<String, dynamic> toJson() => {
        "restaurantName": restaurantName,
        "email": email,
        "password": password,
        "passwordAgain": passwordAgain,
        "phone": phone.toJson(),
      };
}

class RegisterPhone {
  final String countryCode;
  final String phoneNumber;

  RegisterPhone({
    required this.countryCode,
    required this.phoneNumber,
  });

  factory RegisterPhone.fromJson(Map<String, dynamic> json) => RegisterPhone(
        countryCode: json["countryCode"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "countryCode": countryCode,
        "phoneNumber": phoneNumber,
      };
}
