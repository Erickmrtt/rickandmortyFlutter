import 'package:mobx/mobx.dart';
import 'package:rick_and_morty/Episodes/Model/episode_model.dart';
import 'package:rick_and_morty/Episodes/Repository/episode_repository.dart';
part 'episode_store.g.dart';

class EpisodeStore = _EpisodeStore with _$EpisodeStore;

abstract class _EpisodeStore with Store {
  final EpisodeRepository _episodeRepository = EpisodeRepository();

  @observable
  List<EpisodeResult> episodes = <EpisodeResult>[];

  @observable
  bool loading = false;

  @action
  Future<void> getEpisodes() async {
    loading = true;
    episodes = await _episodeRepository.fetchAllEpisodes();
    loading = false;
  }

  @action
  String formatAirDate(int index) {
    final episode = episodes[index];
    final date = episode.created;
    final formattedDate = '${date?.day}/${date?.month}/${date?.year}';
    return formattedDate;
  }

  @action
  String numberEpisodes() {
    return episodes.length.toString();
  }
}
