class GetLocationNameResponseModel {
  final double latitude;
  final double longitude;
  final String continent;
  final String lookupSource;
  final String continentCode;
  final String localityLanguageRequested;
  final String city;
  final String countryName;
  final String countryCode;
  final String postcode;
  final String principalSubdivision;
  final String principalSubdivisionCode;
  final String plusCode;
  final String locality;
  final LocalityInfo localityInfo;

  GetLocationNameResponseModel({
    required this.latitude,
    required this.longitude,
    required this.continent,
    required this.lookupSource,
    required this.continentCode,
    required this.localityLanguageRequested,
    required this.city,
    required this.countryName,
    required this.countryCode,
    required this.postcode,
    required this.principalSubdivision,
    required this.principalSubdivisionCode,
    required this.plusCode,
    required this.locality,
    required this.localityInfo,
  });

  factory GetLocationNameResponseModel.fromJson(Map<String, dynamic> json) =>
      GetLocationNameResponseModel(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        continent: json["continent"],
        lookupSource: json["lookupSource"],
        continentCode: json["continentCode"],
        localityLanguageRequested: json["localityLanguageRequested"],
        city: json["city"],
        countryName: json["countryName"],
        countryCode: json["countryCode"],
        postcode: json["postcode"],
        principalSubdivision: json["principalSubdivision"],
        principalSubdivisionCode: json["principalSubdivisionCode"],
        plusCode: json["plusCode"],
        locality: json["locality"],
        localityInfo: LocalityInfo.fromJson(json["localityInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "continent": continent,
        "lookupSource": lookupSource,
        "continentCode": continentCode,
        "localityLanguageRequested": localityLanguageRequested,
        "city": city,
        "countryName": countryName,
        "countryCode": countryCode,
        "postcode": postcode,
        "principalSubdivision": principalSubdivision,
        "principalSubdivisionCode": principalSubdivisionCode,
        "plusCode": plusCode,
        "locality": locality,
        "localityInfo": localityInfo.toJson(),
      };
}

class LocalityInfo {
  final bool likelyLand;
  final List<Ative> administrative;
  final List<Ative> informative;

  LocalityInfo({
    required this.likelyLand,
    required this.administrative,
    required this.informative,
  });

  factory LocalityInfo.fromJson(Map<String, dynamic> json) => LocalityInfo(
        likelyLand: json["LikelyLand"],
        administrative: List<Ative>.from(
            json["administrative"].map((x) => Ative.fromJson(x))),
        informative:
            List<Ative>.from(json["informative"].map((x) => Ative.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "LikelyLand": likelyLand,
        "administrative":
            List<dynamic>.from(administrative.map((x) => x.toJson())),
        "informative": List<dynamic>.from(informative.map((x) => x.toJson())),
      };
}

class Ative {
  final String name;
  final String description;
  final int order;
  final int? adminLevel;
  final String? isoCode;
  final String? wikidataId;
  final int? geonameId;

  Ative({
    required this.name,
    required this.description,
    required this.order,
    this.adminLevel,
    this.isoCode,
    this.wikidataId,
    this.geonameId,
  });

  factory Ative.fromJson(Map<String, dynamic> json) => Ative(
        name: json["name"],
        description: json["description"],
        order: json["order"],
        adminLevel: json["adminLevel"],
        isoCode: json["isoCode"],
        wikidataId: json["wikidataId"],
        geonameId: json["geonameId"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "order": order,
        "adminLevel": adminLevel,
        "isoCode": isoCode,
        "wikidataId": wikidataId,
        "geonameId": geonameId,
      };
}
