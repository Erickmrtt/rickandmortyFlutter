import 'package:flutter/material.dart';
import 'package:rick_and_morty/Characters/Model/character_model.dart';

class CharacterStatus extends StatelessWidget {
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

  const CharacterStatus({required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: checkLiveCharacter(),
        ),
      ),
    );
  }
}