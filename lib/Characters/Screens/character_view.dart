import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rick_and_morty/Characters/Model/character_model.dart';
import 'package:rick_and_morty/Characters/Repository/character_repository.dart';
import 'package:rick_and_morty/Characters/Screens/Details/character_status_view.dart';
import 'package:rick_and_morty/Common/Components/shimmer_view.dart';
import 'package:rick_and_morty/Episodes/Screens/episode_view.dart';

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
        appBar: AppBar(
          title: const Text('Rick and Morty'),
          centerTitle: true,
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EpisodeView(episodes: character.episode!),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(character.image!),
                      ),
                      title: Text(character.name!),
                      subtitle: Text(character.species!),
                      trailing:  Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CharacterStatus(character: character,),
                            const Icon(Icons.arrow_forward_ios),
                          ]),
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}


