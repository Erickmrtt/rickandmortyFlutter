import 'package:flutter/material.dart';
import 'package:rick_and_morty/Common/Components/shimmer_view.dart';
import 'package:rick_and_morty/Episodes/Model/episode_model.dart';
import 'package:rick_and_morty/Episodes/Repository/episode_repository.dart';

class EpisodeView extends StatefulWidget {
  final List<String> episodes;

  const EpisodeView({super.key, required this.episodes});

  @override
  State<EpisodeView> createState() => _EpisodeViewState();
}

class _EpisodeViewState extends State<EpisodeView> {
  final EpisodeRepository episodeRepository = EpisodeRepository();
  late Future<List<EpisodeResult>> episodesFuture;

  @override
  void initState() {
    super.initState();
    episodesFuture = episodeRepository.fetchEpisodes(widget.episodes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Episodes'),
      ),
      body: FutureBuilder<List<EpisodeResult>>(
        future: episodesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data?[index].name ?? ''),
                  // Outros detalhes do episódio aqui
                );
              },
            );
          } else {
            return const Center(child: ShimmerView());
          }
        },
      ),
    );
  }
}