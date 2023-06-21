class ResetPasswordCheckRequestModel {
  final String mail;

  ResetPasswordCheckRequestModel({
    required this.mail,
  });

  factory ResetPasswordCheckRequestModel.fromJson(Map<String, dynamic> json) =>
      ResetPasswordCheckRequestModel(
        mail: json["mail"],
      );

  Map<String, dynamic> toJson() => {
        "mail": mail,
      };
}
