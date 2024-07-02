import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/Characters/Model/character_model.dart';
import 'package:rick_and_morty/Characters/Stores/character_detail_store.dart';
import 'package:rick_and_morty/Common/Utils/app_colors.dart';
import 'package:rick_and_morty/Episodes/Screens/episode_view.dart';

class CharacterDetailsScreen extends StatefulWidget {
  final CharacterResult character;
  CharacterDetailsScreen({super.key, required this.character});

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  final CharacterDetailStore characterDetailStore = Modular.get<CharacterDetailStore>();

  @override
  void initState () {
    super.initState();
    characterDetailStore.characterResult = widget.character;
     characterDetailStore.getCharacterDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey850,
      appBar: AppBar(
        title: Text(
          widget.character.name!,
          style: GoogleFonts.roboto(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.grey850,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Modular.to.pop(context)
        ),
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
                          backgroundImage: NetworkImage(widget.character.image ?? ''),
                          radius: 50,
                        ),
                        Text(
                          widget.character.name ?? '',
                          style: GoogleFonts.openSans(
                              color: Colors.white, fontSize: 20),
                        ),
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
                        widget.character.species ?? '',
                        style: GoogleFonts.openSans(color: Colors.white),
                      ),
                      Text(widget.character.gender ?? '',
                          style: GoogleFonts.openSans(color: Colors.white)),
                      Observer(
                        builder: (context) {
                          return Text(characterDetailStore.characterStatus,
                              style:
                                  GoogleFonts.openSans(color: characterDetailStore.characterColorStatus));
                        }
                      )
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
          Expanded(flex: 5, child: EpisodeViews(episodes: widget.character.episode!)),
        ],
      ),
    );
  }
}
