class GetBusinessResponseModel {
  final GetBusinessData data;
  final bool isSuccess;
  final int statusCode;
  final List<dynamic> errors;

  GetBusinessResponseModel({
    required this.data,
    required this.isSuccess,
    required this.statusCode,
    required this.errors,
  });

  factory GetBusinessResponseModel.fromJson(Map<String, dynamic> json) =>
      GetBusinessResponseModel(
        data: GetBusinessData.fromJson(json["data"]),
        isSuccess: json["isSuccess"],
        statusCode: json["statusCode"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "isSuccess": isSuccess,
        "statusCode": statusCode,
        "errors": List<dynamic>.from(errors.map((x) => x)),
      };
}

class GetBusinessData {
  final String id;
  final String name;
  final dynamic address;
  final dynamic currentPlanId;
  final dynamic category;
  final dynamic profileImage;
  final bool isActive;
  final bool isVerified;
  final String defaultCurrency;
  final SocialMedias socialMedias;
  final String email;
  final Phone phone;

  GetBusinessData({
    required this.id,
    required this.name,
    this.address,
    this.currentPlanId,
    this.category,
    this.profileImage,
    required this.isActive,
    required this.isVerified,
    required this.defaultCurrency,
    required this.socialMedias,
    required this.email,
    required this.phone,
  });

  factory GetBusinessData.fromJson(Map<String, dynamic> json) =>
      GetBusinessData(
        id: json["_id"],
        name: json["name"],
        address: json["address"],
        currentPlanId: json["currentPlanId"],
        category: json["category"],
        profileImage: json["profileImage"],
        isActive: json["isActive"],
        isVerified: json["isVerified"],
        defaultCurrency: json["defaultCurrency"],
        socialMedias: SocialMedias.fromJson(json["socialMedias"]),
        email: json["email"],
        phone: Phone.fromJson(json["phone"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "address": address,
        "currentPlanId": currentPlanId,
        "category": category,
        "profileImage": profileImage,
        "isActive": isActive,
        "isVerified": isVerified,
        "defaultCurrency": defaultCurrency,
        "socialMedias": socialMedias.toJson(),
        "email": email,
        "phone": phone.toJson(),
      };
}

class Phone {
  final String countryCode;
  final String phoneNumber;

  Phone({
    required this.countryCode,
    required this.phoneNumber,
  });

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
        countryCode: json["countryCode"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "countryCode": countryCode,
        "phoneNumber": phoneNumber,
      };
}

class SocialMedias {
  final dynamic instagram;
  final dynamic facebook;
  final dynamic twitter;
  final dynamic threads;
  final dynamic whatsapp;
  final dynamic website;
  final String id;

  SocialMedias({
    this.instagram,
    this.facebook,
    this.twitter,
    this.threads,
    this.whatsapp,
    this.website,
    required this.id,
  });

  factory SocialMedias.fromJson(Map<String, dynamic> json) => SocialMedias(
        instagram: json["instagram"],
        facebook: json["facebook"],
        twitter: json["twitter"],
        threads: json["threads"],
        whatsapp: json["whatsapp"],
        website: json["website"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "instagram": instagram,
        "facebook": facebook,
        "twitter": twitter,
        "threads": threads,
        "whatsapp": whatsapp,
        "website": website,
        "_id": id,
      };
}
