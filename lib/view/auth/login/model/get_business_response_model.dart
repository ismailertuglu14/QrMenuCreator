class GetBusinessResponseModel {
  final GetProductByIdData data;
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
        data: GetProductByIdData.fromJson(json["data"]),
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

class GetProductByIdData {
  final Location location;
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
  final Purchase? purchase;

  GetProductByIdData({
    required this.location,
    required this.id,
    required this.name,
    this.address,
    required this.currentPlanId,
    this.category,
    this.profileImage,
    required this.isActive,
    required this.isVerified,
    required this.defaultCurrency,
    required this.socialMedias,
    required this.email,
    required this.phone,
    required this.purchase,
  });

  factory GetProductByIdData.fromJson(Map<String, dynamic> json) =>
      GetProductByIdData(
        location: Location.fromJson(json["location"]),
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
        purchase: Purchase.fromJson(json["purchase"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
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
        "purchase": purchase?.toJson(),
      };
}

class Location {
  final dynamic latitude;
  final dynamic longitude;

  Location({
    this.latitude,
    this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"],
        longitude: json["longitude"],
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

class Purchase {
  final Plan plan;
  final String periodType;
  final int price;
  final DateTime purchaseDate;
  final DateTime expirationDate;
  final bool isActive;

  Purchase({
    required this.plan,
    required this.periodType,
    required this.price,
    required this.purchaseDate,
    required this.expirationDate,
    required this.isActive,
  });

  factory Purchase.fromJson(Map<String, dynamic> json) => Purchase(
        plan: Plan.fromJson(json["plan"]),
        periodType: json["periodType"],
        price: json["price"],
        purchaseDate: DateTime.parse(json["purchaseDate"]),
        expirationDate: DateTime.parse(json["expirationDate"]),
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "plan": plan.toJson(),
        "periodType": periodType,
        "price": price,
        "purchaseDate": purchaseDate.toIso8601String(),
        "expirationDate": expirationDate.toIso8601String(),
        "isActive": isActive,
      };
}

class Plan {
  final String id;
  final String name;
  final List<Feature> features;
  final int monthlyPrice;
  final int annuallyPrice;
  final int monthlyDiscount;
  final int annuallyDiscount;
  final int maxMenuCount;
  final int maxProductCount;

  Plan({
    required this.id,
    required this.name,
    required this.features,
    required this.monthlyPrice,
    required this.annuallyPrice,
    required this.monthlyDiscount,
    required this.annuallyDiscount,
    required this.maxMenuCount,
    required this.maxProductCount,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json["_id"],
        name: json["name"],
        features: List<Feature>.from(
            json["features"].map((x) => Feature.fromJson(x))),
        monthlyPrice: json["monthlyPrice"],
        annuallyPrice: json["annuallyPrice"],
        monthlyDiscount: json["monthlyDiscount"],
        annuallyDiscount: json["annuallyDiscount"],
        maxMenuCount: json["maxMenuCount"],
        maxProductCount: json["maxProductCount"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
        "monthlyPrice": monthlyPrice,
        "annuallyPrice": annuallyPrice,
        "monthlyDiscount": monthlyDiscount,
        "annuallyDiscount": annuallyDiscount,
        "maxMenuCount": maxMenuCount,
        "maxProductCount": maxProductCount,
      };
}

class Feature {
  final String description;
  final bool isAvailable;

  Feature({
    required this.description,
    required this.isAvailable,
  });

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        description: json["description"],
        isAvailable: json["isAvailable"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "isAvailable": isAvailable,
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
