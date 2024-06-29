// To parse this JSON data, do
//
//     final characterModel = characterModelFromJson(jsonString);

import 'dart:convert';

CharacterModel characterModelFromJson(String str) =>
    CharacterModel.fromJson(json.decode(str));

String characterModelToJson(CharacterModel data) => json.encode(data.toJson());

class CharacterModel {
  List<CharacterResult>? results;

  CharacterModel({
    this.results,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        results: json["results"] == null
            ? []
            : List<CharacterResult>.from(
                json["results"]!.map((x) => CharacterResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class CharacterResult {
  int? id;
  String? name;
  Status? status;
  String? species;
  String? type;
  String? gender;
  Location? origin;
  Location? location;
  String? image;
  List<String>? episode;
  String? url;
  DateTime? created;

  CharacterResult({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  factory CharacterResult.fromJson(Map<String, dynamic> json) =>
      CharacterResult(
        id: json["id"],
        name: json["name"],
        status: parseStatus(json['status'] as String),
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        origin:
            json["origin"] == null ? null : Location.fromJson(json["origin"]),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        image: json["image"],
        episode: json["episode"] == null
            ? []
            : List<String>.from(json["episode"]!.map((x) => x)),
        url: json["url"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
        "type": type,
        "gender": gender,
        "origin": origin?.toJson(),
        "location": location?.toJson(),
        "image": image,
        "episode":
            episode == null ? [] : List<dynamic>.from(episode!.map((x) => x)),
        "url": url,
        "created": created?.toIso8601String(),
      };
  static Status parseStatus(String status) {
    switch (status.toLowerCase()) {
      case 'alive':
        return Status.alive;
      case 'dead':
        return Status.dead;
      case 'unknown':
        return Status.unknown;
      default:
        return Status
            .unknown;
    }
  }
}

class Location {
  String? name;
  String? url;

  Location({
    this.name,
    this.url,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

enum Status { alive, dead, unknown }


