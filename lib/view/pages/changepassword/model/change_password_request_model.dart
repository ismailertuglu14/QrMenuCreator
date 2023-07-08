class ChangePasswordRequestModel {
  final String oldPassword;
  final String newPassword;

  ChangePasswordRequestModel({
    required this.oldPassword,
    required this.newPassword,
  });

  factory ChangePasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      ChangePasswordRequestModel(
        oldPassword: json["oldPassword"],
        newPassword: json["newPassword"],
      );

  Map<String, dynamic> toJson() => {
        "oldPassword": oldPassword,
        "newPassword": newPassword,
      };
}
