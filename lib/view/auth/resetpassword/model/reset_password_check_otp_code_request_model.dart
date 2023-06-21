class ResetPasswordCheckOtpCodeRequestModel {
  final String mail;
  final String code;

  ResetPasswordCheckOtpCodeRequestModel({
    required this.mail,
    required this.code,
  });

  factory ResetPasswordCheckOtpCodeRequestModel.fromJson(
          Map<String, dynamic> json) =>
      ResetPasswordCheckOtpCodeRequestModel(
        mail: json["mail"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "mail": mail,
        "code": code,
      };
}
