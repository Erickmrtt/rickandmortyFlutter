import 'package:flutter/material.dart';
import 'package:rick_and_morty/Characters/Model/character_model.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final CharacterResult character;

  const CharacterDetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(character.image ?? ''),
            Text(character.name ?? ''),
            Text(character.species ?? ''),
            // Adicione mais detalhes do personagem aqui
          ],
        ),
      ),
    );
  }
}