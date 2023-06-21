class RegisterRequestModel {
  RegisterRequestModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
   required this.confirmPassword ,
    required this.contactNumber ,
    this.referralCode ,
  });

  final String firstName;
  final String lastName;
  final String confirmPassword;
  final String contactNumber;
  final String?  referralCode;
  final String email;
  final String password;

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      RegisterRequestModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
        contactNumber: json["contactNumber"],
        referralCode: json["referralCode"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
        "contactNumber": contactNumber,
        "referralCode": referralCode,
        
      };
}
