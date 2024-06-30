import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/Characters/Model/character_model.dart';
import 'package:rick_and_morty/Common/Utils/app_colors.dart';
import 'package:rick_and_morty/Episodes/Screens/episode_view.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final CharacterResult character;
  Color checkLiveCharacter() {
    switch (character.status) {
      case Status.alive:
        return Colors.green;
      case Status.dead:
        return Colors.red;
      default:
        return Colors.yellow;
    }
  }

  String checkLiveText() {
    switch (character.status) {
      case Status.alive:
        return "Alive";
      case Status.dead:
        return "Dead";
      default:
        return "Unknown";
    }
  }

  const CharacterDetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey850,
      appBar: AppBar(
        title: Text(
          character.name!,
          style: GoogleFonts.roboto(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.grey850,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(character.image ?? ''),
                          radius: 50,
                        ),
                        Text(
                          character.name ?? '',
                          style: GoogleFonts.openSans(
                              color: Colors.white, fontSize: 20),
                        ),
                        // Adicione mais detalhes do personagem aqui
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        character.species ?? '',
                        style: GoogleFonts.openSans(color: Colors.white),
                      ),
                      Text(character.gender ?? '',
                          style: GoogleFonts.openSans(color: Colors.white)),
                      Text(checkLiveText(),
                          style:
                              GoogleFonts.openSans(color: checkLiveCharacter()))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "EPISODES:",
              textAlign: TextAlign.left,
              style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          Expanded(flex: 5, child: EpisodeViews(episodes: character.episode!)),
        ],
      ),
    );
  }
}
