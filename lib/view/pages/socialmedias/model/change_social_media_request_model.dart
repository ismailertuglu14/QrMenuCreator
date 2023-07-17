class ChangeSocialMediaRequestModel {
  final String instagram;
  final String twitter;
  final dynamic threads;
  final String facebook;
  final String website;
  final String whatsapp;

  ChangeSocialMediaRequestModel({
    required this.instagram,
    required this.twitter,
    this.threads,
    required this.facebook,
    required this.website,
    required this.whatsapp,
  });

  factory ChangeSocialMediaRequestModel.fromJson(Map<String, dynamic> json) =>
      ChangeSocialMediaRequestModel(
        instagram: json["instagram"],
        twitter: json["twitter"],
        threads: json["threads"],
        facebook: json["facebook"],
        website: json["website"],
        whatsapp: json["whatsapp"],
      );

  Map<String, dynamic> toJson() => {
        "instagram": instagram,
        "twitter": twitter,
        "threads": threads,
        "facebook": facebook,
        "website": website,
        "whatsapp": whatsapp,
      };
}
