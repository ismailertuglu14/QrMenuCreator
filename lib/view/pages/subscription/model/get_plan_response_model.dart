class GetPlanResponseModel {
  final List<GetPlanData> data;
  final bool isSuccess;
  final int statusCode;
  final List<dynamic> errors;

  GetPlanResponseModel({
    required this.data,
    required this.isSuccess,
    required this.statusCode,
    required this.errors,
  });

  factory GetPlanResponseModel.fromJson(Map<String, dynamic> json) =>
      GetPlanResponseModel(
        data: List<GetPlanData>.from(
            json["data"].map((x) => GetPlanData.fromJson(x))),
        isSuccess: json["isSuccess"],
        statusCode: json["statusCode"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "isSuccess": isSuccess,
        "statusCode": statusCode,
        "errors": List<dynamic>.from(errors.map((x) => x)),
      };
}

class GetPlanData {
  final String id;
  final String name;
  final List<SubscriptionFeature> features;
  final int monthlyPrice;
  final int annuallyPrice;
  final int monthlyDiscount;
  final int annuallyDiscount;
  final int maxMenuCount;
  final int maxProductCount;
  final DateTime createdDate;
  final dynamic updatedDate;
  final bool isActive;
  final int position;

  GetPlanData({
    required this.id,
    required this.name,
    required this.features,
    required this.monthlyPrice,
    required this.annuallyPrice,
    required this.monthlyDiscount,
    required this.annuallyDiscount,
    required this.maxMenuCount,
    required this.maxProductCount,
    required this.createdDate,
    this.updatedDate,
    required this.isActive,
    required this.position,
  });

  factory GetPlanData.fromJson(Map<String, dynamic> json) => GetPlanData(
        id: json["_id"],
        name: json["name"],
        features: List<SubscriptionFeature>.from(
            json["features"].map((x) => SubscriptionFeature.fromJson(x))),
        monthlyPrice: json["monthlyPrice"],
        annuallyPrice: json["annuallyPrice"],
        monthlyDiscount: json["monthlyDiscount"],
        annuallyDiscount: json["annuallyDiscount"],
        maxMenuCount: json["maxMenuCount"],
        maxProductCount: json["maxProductCount"],
        createdDate: DateTime.parse(json["createdDate"]),
        updatedDate: json["updatedDate"],
        isActive: json["isActive"],
        position: json["position"],
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
        "createdDate": createdDate.toIso8601String(),
        "updatedDate": updatedDate,
        "isActive": isActive,
        "position": position,
      };
}

class SubscriptionFeature {
  final String description;
  final bool isAvailable;

  SubscriptionFeature({
    required this.description,
    required this.isAvailable,
  });

  factory SubscriptionFeature.fromJson(Map<String, dynamic> json) =>
      SubscriptionFeature(
        description: json["description"],
        isAvailable: json["isAvailable"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "isAvailable": isAvailable,
      };
}
