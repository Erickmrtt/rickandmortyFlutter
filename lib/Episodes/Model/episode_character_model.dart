import 'dart:convert';

EpisodeModel episodeModelFromJson(String str) => EpisodeModel.fromJson(json.decode(str));

String episodeModelToJson(EpisodeModel data) => json.encode(data.toJson());

class EpisodeModel {
    List<EpisodeCharacterResult>? results;

    EpisodeModel({
        this.results,
    });

    factory EpisodeModel.fromJson(Map<String, dynamic> json) => EpisodeModel(
        results: json["results"] == null ? [] : List<EpisodeCharacterResult>.from(json["results"]!.map((x) => EpisodeCharacterResult.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class EpisodeCharacterResult {
    int? id;
    String? name;
    String? type;
    String? dimension;
    List<String>? residents;
    String? url;
    DateTime? created;

    EpisodeCharacterResult({
        this.id,
        this.name,
        this.type,
        this.dimension,
        this.residents,
        this.url,
        this.created,
    });

    factory EpisodeCharacterResult.fromJson(Map<String, dynamic> json) => EpisodeCharacterResult(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        dimension: json["dimension"],
        residents: json["residents"] == null ? [] : List<String>.from(json["residents"]!.map((x) => x)),
        url: json["url"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "dimension": dimension,
        "residents": residents == null ? [] : List<dynamic>.from(residents!.map((x) => x)),
        "url": url,
        "created": created?.toIso8601String(),
    };
}
