import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rick_and_morty/Common/Utils/app_colors.dart';
import 'package:rick_and_morty/Episodes/Store/episode_store.dart';

class EpisodeView extends StatefulWidget {
  const EpisodeView({super.key});

  @override
  State<EpisodeView> createState() => _EpisodeViewState();
}

class _EpisodeViewState extends State<EpisodeView> {
  final EpisodeStore episodeStore = Modular.get<EpisodeStore>();
  @override
  void initState() {
    episodeStore.getEpisodes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey850,
      appBar: AppBar(
        title: const Text('Episodes'),
        backgroundColor: AppColors.grey850,
      ),
      body: Observer(
        builder: (_) {
          if (episodeStore.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: episodeStore.episodes.length,
            itemBuilder: (context, index) {
              final episode = episodeStore.episodes[index];
              return ListTile(
                title: Text(episode.name ?? ''),
                subtitle: Text(episode.episode ?? ""),
                trailing: Text(episodeStore.formatAirDate(index)),
              );
            },
          );
        },
      ),
    );
  }
}
