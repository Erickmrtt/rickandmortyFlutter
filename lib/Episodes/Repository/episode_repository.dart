import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/Episodes/Model/episode_model.dart';

class EpisodeRepository {
  Future<List<EpisodeResult>> fetchEpisodes(List<String> episodeUrls) async {
    final responses = await Future.wait(
      episodeUrls.map((url) => http.get(Uri.parse(url))),
    );
    List<EpisodeResult> episodesList = [];
    for (var response in responses) {
      if (response.statusCode == 200) {
        episodesList.add(EpisodeResult.fromJson(jsonDecode(response.body)));
      } else {
        // Trate erros ou adicione lógica para lidar com falhas
        print('Failed to load episode from ${response.request?.url}');
      }
    }
    return episodesList;
  }
}