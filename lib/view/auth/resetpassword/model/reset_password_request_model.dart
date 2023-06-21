class ResetPasswordRequestModel {
  final String mail;
  final String code;
  final String newPassword;
  final String newPasswordAgain;

  ResetPasswordRequestModel({
    required this.mail,
    required this.code,
    required this.newPassword,
    required this.newPasswordAgain,
  });

  factory ResetPasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      ResetPasswordRequestModel(
        mail: json["Mail"],
        code: json["Code"],
        newPassword: json["newPassword"],
        newPasswordAgain: json["newPasswordAgain"],
      );

  Map<String, dynamic> toJson() => {
        "Mail": mail,
        "Code": code,
        "newPassword": newPassword,
        "newPasswordAgain": newPasswordAgain,
      };
}
