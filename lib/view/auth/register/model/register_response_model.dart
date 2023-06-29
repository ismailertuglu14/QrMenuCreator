class RegisterResponseModel {
  final dynamic data;
  final bool isSuccess;
  final int statusCode;
  final List<dynamic> errors;

  RegisterResponseModel({
    required this.data,
    required this.isSuccess,
    required this.statusCode,
    required this.errors,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModel(
        data: Data.fromJson(json["data"]),
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

class Data {
  final RestauntCredentialResponse restauntCredentialResponse;
  final RestaurantResponse restaurantResponse;

  Data({
    required this.restauntCredentialResponse,
    required this.restaurantResponse,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        restauntCredentialResponse: RestauntCredentialResponse.fromJson(
            json["restauntCredentialResponse"]),
        restaurantResponse:
            RestaurantResponse.fromJson(json["restaurantResponse"]),
      );

  Map<String, dynamic> toJson() => {
        "restauntCredentialResponse": restauntCredentialResponse.toJson(),
        "restaurantResponse": restaurantResponse.toJson(),
      };
}

class RestauntCredentialResponse {
  final String email;
  final String hashedPassword;
  final Phone phone;
  final String id;
  final int v;

  RestauntCredentialResponse({
    required this.email,
    required this.hashedPassword,
    required this.phone,
    required this.id,
    required this.v,
  });

  factory RestauntCredentialResponse.fromJson(Map<String, dynamic> json) =>
      RestauntCredentialResponse(
        email: json["email"],
        hashedPassword: json["hashedPassword"],
        phone: Phone.fromJson(json["phone"]),
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "hashedPassword": hashedPassword,
        "phone": phone.toJson(),
        "_id": id,
        "__v": v,
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

class RestaurantResponse {
  final String id;
  final int role;
  final String name;
  final dynamic address;
  final dynamic currentPlanId;
  final dynamic category;
  final dynamic profileImage;
  final dynamic bannerImage;
  final int v;

  RestaurantResponse({
    required this.id,
    required this.role,
    required this.name,
    this.address,
    this.currentPlanId,
    this.category,
    this.profileImage,
    this.bannerImage,
    required this.v,
  });

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) =>
      RestaurantResponse(
        id: json["_id"],
        role: json["role"],
        name: json["name"],
        address: json["address"],
        currentPlanId: json["currentPlanId"],
        category: json["category"],
        profileImage: json["profileImage"],
        bannerImage: json["bannerImage"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "role": role,
        "name": name,
        "address": address,
        "currentPlanId": currentPlanId,
        "category": category,
        "profileImage": profileImage,
        "bannerImage": bannerImage,
        "__v": v,
      };
}
