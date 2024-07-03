import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/Common/Components/shimmer_view.dart';
import 'package:rick_and_morty/Common/Utils/app_colors.dart';
import 'package:rick_and_morty/Episodes/Model/episode_character_model.dart';
import 'package:rick_and_morty/Episodes/Model/episode_model.dart';
import 'package:rick_and_morty/Episodes/Repository/episode_repository.dart';
class EpisodeDetailsView extends StatefulWidget {
  final List<String> episodes;

  const EpisodeDetailsView({super.key, required this.episodes});

  @override
  State<EpisodeDetailsView> createState() => _EpisodeDetailsViewState();
}

class _EpisodeDetailsViewState extends State<EpisodeDetailsView> {
  final EpisodeRepository episodeRepository = EpisodeRepository();
  late Future<List<EpisodeCharacterResult>> episodesFuture;

  @override
  void initState() {
    super.initState();
    episodesFuture = episodeRepository.fetchCharacterEpisode(widget.episodes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey850,
      body: FutureBuilder<List<EpisodeCharacterResult>>(
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
