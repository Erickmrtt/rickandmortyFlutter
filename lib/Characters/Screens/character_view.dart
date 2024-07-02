import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/Characters/Model/character_model.dart';
import 'package:rick_and_morty/Characters/Repository/character_repository.dart';
import 'package:rick_and_morty/Characters/Screens/character_widget.dart';
import 'package:rick_and_morty/Common/Components/shimmer_view.dart';
import 'package:rick_and_morty/Common/Utils/app_colors.dart';
import 'package:rick_and_morty/Common/Utils/strings.dart';

class CharacterView extends StatefulWidget {
  const CharacterView({super.key});

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  final CharacterRepository characterRepository =
      Modular.get<CharacterRepository>();
  late Future<List<CharacterResult>> characters;

  @override
  void initState() {
    super.initState();
    characters = characterRepository.fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.grey850,
        appBar: AppBar(
          title: Text('Rick and Morty',
              style: GoogleFonts.roboto(color: Colors.white)),
          centerTitle: true,
          backgroundColor: AppColors.grey850,
        ),
        body: FutureBuilder<List<CharacterResult>>(
          future: characters,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: ShimmerView(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Ops! An unexpected error occurred: ${snapshot.error}'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          characters = characterRepository.fetchCharacters();
                        });
                      },
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final character = snapshot.data![index];
                  return InkWell(
                    onTap: () =>  Modular.to.pushNamed(Strings.characterDetailsScreen, arguments: character),
                    child: CharacterWidget(character: character),
                  );
                },
              );
            }
          },
        ));
  }
}
