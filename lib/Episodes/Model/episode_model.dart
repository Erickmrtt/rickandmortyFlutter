import 'dart:convert';

EpisodeModel episodeModelFromJson(String str) => EpisodeModel.fromJson(json.decode(str));

String episodeModelToJson(EpisodeModel data) => json.encode(data.toJson());

class EpisodeModel {
    List<EpisodeResult>? results;

    EpisodeModel({
        this.results,
    });

    factory EpisodeModel.fromJson(Map<String, dynamic> json) => EpisodeModel(
        results: json["results"] == null ? [] : List<EpisodeResult>.from(json["results"]!.map((x) => EpisodeResult.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class EpisodeResult {
    int? id;
    String? name;
    String? airDate;
    String? episode;
    List<String>? characters;
    String? url;
    DateTime? created;

    EpisodeResult({
        this.id,
        this.name,
        this.airDate,
        this.episode,
        this.characters,
        this.url,
        this.created,
    });

    factory EpisodeResult.fromJson(Map<String, dynamic> json) => EpisodeResult(
        id: json["id"],
        name: json["name"],
        airDate: json["air_date"],
        episode: json["episode"],
        characters: json["characters"] == null ? [] : List<String>.from(json["characters"]!.map((x) => x)),
        url: json["url"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "air_date": airDate,
        "episode": episode,
        "characters": characters == null ? [] : List<dynamic>.from(characters!.map((x) => x)),
        "url": url,
        "created": created?.toIso8601String(),
    };
}
