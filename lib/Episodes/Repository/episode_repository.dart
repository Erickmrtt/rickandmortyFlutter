import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/Episodes/Model/episode_character_model.dart';
import 'package:rick_and_morty/Episodes/Model/episode_model.dart';

class EpisodeRepository {
  Future<List<EpisodeResult>> fetchAllEpisodes(){
    return http.get(Uri.parse('https://rickandmortyapi.com/api/episode'))
        .then((response) {
      if (response.statusCode == 200) {
        final decode = jsonDecode(response.body);
        final results = decode['results'] as List;
        return results
            .map<EpisodeResult>((item) => EpisodeResult.fromJson(item))
            .toList();
      } else {
        print('Failed to load episodes from ${response.request?.url}');
        return [];
      }
    });
  }
  Future<List<EpisodeCharacterResult>> fetchEpisodes(List<String> episodeUrls) async {
    final responses = await Future.wait(
      episodeUrls.map((url) => http.get(Uri.parse(url))),
    );
    return responses
        .where((response) => response.statusCode == 200)
        .map((response) => EpisodeCharacterResult.fromJson(jsonDecode(response.body)))
        .toList();
  }

  Future<List<EpisodeCharacterResult>> fetchCharacterEpisode(List<String> episodeUrls) async {
    try {
      final responses = await Future.wait(
        episodeUrls.map((url) => http.get(Uri.parse(url))),
        eagerError: true,
      );

      return responses
          .map((response) {
            if (response.statusCode == 200) {
              return EpisodeCharacterResult.fromJson(jsonDecode(response.body));
            } else {
              print(
                  'Failed to load episode from ${response.request?.url} with status code ${response.statusCode}');
              return null;
            }
          })
          .where((result) => result != null)
          .cast<EpisodeCharacterResult>()
          .toList();
    } catch (e) {
      print('An error occurred while fetching episodes: $e');
      return [];
    }
  }
}
