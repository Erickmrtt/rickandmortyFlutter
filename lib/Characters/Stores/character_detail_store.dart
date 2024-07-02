import 'dart:ui';

import 'package:mobx/mobx.dart';
import 'package:rick_and_morty/Characters/Model/character_model.dart';
import 'package:rick_and_morty/Characters/Repository/character_repository.dart';
import 'package:rick_and_morty/Common/Utils/app_colors.dart';

part 'character_detail_store.g.dart';

// ignore: library_private_types_in_public_api
class CharacterDetailStore = _CharacterDetailStore with _$CharacterDetailStore;

abstract class _CharacterDetailStore with Store {
  final CharacterRepository _characterRepository = CharacterRepository();

  @observable
  List<CharacterResult> character = <CharacterResult>[];

  @observable
  CharacterResult characterResult = CharacterResult();

  @observable
  String characterStatus = "";

  @observable
  Color characterColorStatus = AppColors.yellow;

  @action
  Future<Color> _checkLiveCharacter() async {
    switch (characterResult.status) {
      case Status.alive:
        characterColorStatus = AppColors.green;
        return characterColorStatus;
      case Status.dead:
      characterColorStatus = AppColors.red;
        return characterColorStatus;
      default:
      characterColorStatus = AppColors.yellow;
        return characterColorStatus;
    }
  }

  @action
  Future<String> _checkLiveText() async {
    switch (characterResult.status) {
      case Status.alive:
        characterStatus = "Alive";
        return characterStatus;
      case Status.dead:
        characterStatus = "Dead";
        return characterStatus;
      default:
        characterStatus = "Unknown";
        return characterStatus;
    }
  }

  @observable
  bool loading = false;

  @action
  Future<void> getCharacterDetail() async {
    loading = true;
    //character = await _characterRepository.fetchCharacters();
    await _checkLiveText();
    await _checkLiveCharacter();
    loading = false;
  }
}
