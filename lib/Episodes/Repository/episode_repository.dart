import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/Episodes/Model/episode_model.dart';

class EpisodeRepository {
  Future<List<EpisodeResult>> fetchEpisodes(List<String> episodeUrls) async {
    final responses = await Future.wait(
      episodeUrls.map((url) => http.get(Uri.parse(url))),
    );
    return responses
        .where((response) => response.statusCode == 200)
        .map((response) => EpisodeResult.fromJson(jsonDecode(response.body)))
        .toList();
  }

  Future<List<EpisodeResult>> fetchEpisode(List<String> episodeUrls) async {
    try {
      final responses = await Future.wait(
        episodeUrls.map((url) => http.get(Uri.parse(url))),
        eagerError: true,
      );

      return responses
          .map((response) {
            if (response.statusCode == 200) {
              return EpisodeResult.fromJson(jsonDecode(response.body));
            } else {
              print(
                  'Failed to load episode from ${response.request?.url} with status code ${response.statusCode}');
              return null;
            }
          })
          .where((result) => result != null)
          .cast<EpisodeResult>()
          .toList();
    } catch (e) {
      print('An error occurred while fetching episodes: $e');
      return [];
    }
  }
}
