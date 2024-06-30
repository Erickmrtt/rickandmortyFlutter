import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/Common/Components/shimmer_view.dart';
import 'package:rick_and_morty/Common/Utils/app_colors.dart';
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
    episodesFuture = episodeRepository.fetchEpisode(widget.episodes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

class EpisodeViews extends StatefulWidget {
  final List<String> episodes;

  const EpisodeViews({super.key, required this.episodes});

  @override
  State<EpisodeViews> createState() => _EpisodeViewsState();
}

class _EpisodeViewsState extends State<EpisodeViews> {
  final EpisodeRepository episodeRepository = EpisodeRepository();
  late Future<List<EpisodeResult>> episodesFuture;

  @override
  void initState() {
    super.initState();
    episodesFuture = episodeRepository.fetchEpisode(widget.episodes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey850,
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
                return Container(
                  color: AppColors.grey850,
                  child: ListTile(
                    title: Text(
                      snapshot.data?[index].name ?? '',
                      style: GoogleFonts.roboto(color: Colors.white),
                    ),
                    // Outros detalhes do episódio aqui
                  ),
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
