class ChangeSocialMediaRequestModel {
  final String? instagram;
  final String? twitter;
  final String? threads;
  final String? facebook;
  final String? whatsapp;
  final String? website;

  ChangeSocialMediaRequestModel({
    this.instagram,
    this.twitter,
    this.threads,
    this.facebook,
    this.website,
    this.whatsapp,
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
