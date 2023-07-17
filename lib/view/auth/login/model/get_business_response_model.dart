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
  final Location location;
  final bool isVerified;
  final String defaultCurrency;
  final String id;
  final String name;
  final dynamic address;
  final dynamic currentPlanId;
  final dynamic category;
  final String? profileImage;
  final dynamic bannerImage;
  final SocialMedias socialMedias;
  final bool isActive;
  final String email;
  final Phone phone;

  GetBusinessData({
    required this.location,
    required this.isVerified,
    required this.defaultCurrency,
    required this.id,
    required this.name,
    this.address,
    this.currentPlanId,
    this.category,
    required this.profileImage,
    this.bannerImage,
    required this.socialMedias,
    required this.isActive,
    required this.email,
    required this.phone,
  });

  factory GetBusinessData.fromJson(Map<String, dynamic> json) =>
      GetBusinessData(
        location: Location.fromJson(json["location"]),
        isVerified: json["isVerified"],
        defaultCurrency: json["defaultCurrency"],
        id: json["_id"],
        name: json["name"],
        address: json["address"],
        currentPlanId: json["currentPlanId"],
        category: json["category"],
        profileImage: json["profileImage"],
        bannerImage: json["bannerImage"],
        socialMedias: SocialMedias.fromJson(json["socialMedias"]),
        isActive: json["isActive"],
        email: json["email"],
        phone: Phone.fromJson(json["phone"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "isVerified": isVerified,
        "defaultCurrency": defaultCurrency,
        "_id": id,
        "name": name,
        "address": address,
        "currentPlanId": currentPlanId,
        "category": category,
        "profileImage": profileImage,
        "bannerImage": bannerImage,
        "socialMedias": socialMedias.toJson(),
        "isActive": isActive,
        "email": email,
        "phone": phone.toJson(),
      };
}

class Location {
  final double latitude;
  final double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
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
  final String instagram;
  final String facebook;
  final String twitter;
  final String threads;
  final String whatsapp;
  final String website;
  final String id;

  SocialMedias({
    required this.instagram,
    required this.facebook,
    required this.twitter,
    required this.threads,
    required this.whatsapp,
    required this.website,
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
