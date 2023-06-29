class UpdateProfileRequestModel {
  String firstName;
  String lastName;
  String userName;
  String title;
  String bio;
  String email;
  DateTime birthdayDate;
  int gender;

  UpdateProfileRequestModel({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.bio,
    required this.email,
    required this.birthdayDate,
    required this.gender,
    required this.title,
  });

  factory UpdateProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      UpdateProfileRequestModel(
          title: json["title"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        userName: json["userName"],
        bio: json["bio"],
        email: json["email"],
        birthdayDate: DateTime.parse(json["birthdayDate"]),
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "firstName": firstName,
        "lastName": lastName,
        "userName": userName,
        "bio": bio,
        "email": email,
        "birthdayDate": birthdayDate.toIso8601String(),
        "gender": gender,
      };
}
