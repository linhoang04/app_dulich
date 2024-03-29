// To parse this JSON data, do
//
//     final city = cityFromJson(jsonString);

import 'dart:convert';

Citi cityFromJson(String str) => Citi.fromJson(json.decode(str));

String cityToJson(Citi data) => json.encode(data.toJson());

class Citi {
  final List<CitiModel> results;
  final double generationtimeMs;

  Citi({
    required this.results,
    required this.generationtimeMs,
  });

  factory Citi.fromJson(Map<String, dynamic> json) => Citi(
        results: List<CitiModel>.from(
            json["results"].map((x) => CitiModel.fromJson(x))),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "generationtime_ms": generationtimeMs,
      };
}

class CitiModel {
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final double? elevation;
  final String featureCode;
  final String countryCode;
  final int? admin1Id;
  final String timezone;
  final int? population;
  final int? countryId;
  final String? country;
  final String? admin1;

  CitiModel({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.elevation,
    required this.featureCode,
    required this.countryCode,
    this.admin1Id,
    required this.timezone,
    this.population,
    required this.countryId,
    required this.country,
    this.admin1,
  });

  factory CitiModel.fromJson(Map<String, dynamic> json) => CitiModel(
        id: json["id"],
        name: json["name"] ?? "",
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        elevation: json["elevation"],
        featureCode: json["feature_code"],
        countryCode: json["country_code"],
        admin1Id: json["admin1_id"],
        timezone: json["timezone"],
        population: json["population"],
        countryId: json["country_id"],
        country: json["country"],
        admin1: json["admin1"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "elevation": elevation,
        "feature_code": featureCode,
        "country_code": countryCode,
        "admin1_id": admin1Id,
        "timezone": timezone,
        "population": population,
        "country_id": countryId,
        "country": country,
        "admin1": admin1,
      };
}
