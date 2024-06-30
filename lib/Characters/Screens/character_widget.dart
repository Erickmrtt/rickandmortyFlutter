import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/Characters/Model/character_model.dart';
import 'package:rick_and_morty/Characters/Screens/Details/character_status_view.dart';

class CharacterWidget extends StatelessWidget {
  const CharacterWidget({
    super.key,
    required this.character,
  });

  final CharacterResult character;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(1),
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(character.image!),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(character.name!,
                      style: GoogleFonts.roboto(color: Colors.white)),
                  Text(character.species!,
                      style: GoogleFonts.roboto(color: Colors.white)),
                ],
              ),
            ),
            const Spacer(),
            CharacterStatus(
              character: character,
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
