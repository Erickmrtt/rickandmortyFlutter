// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterDetailStore on _CharacterDetailStore, Store {
  late final _$characterAtom =
      Atom(name: '_CharacterDetailStore.character', context: context);

  @override
  List<CharacterResult> get character {
    _$characterAtom.reportRead();
    return super.character;
  }

  @override
  set character(List<CharacterResult> value) {
    _$characterAtom.reportWrite(value, super.character, () {
      super.character = value;
    });
  }

  late final _$characterResultAtom =
      Atom(name: '_CharacterDetailStore.characterResult', context: context);

  @override
  CharacterResult get characterResult {
    _$characterResultAtom.reportRead();
    return super.characterResult;
  }

  @override
  set characterResult(CharacterResult value) {
    _$characterResultAtom.reportWrite(value, super.characterResult, () {
      super.characterResult = value;
    });
  }

  late final _$characterStatusAtom =
      Atom(name: '_CharacterDetailStore.characterStatus', context: context);

  @override
  String get characterStatus {
    _$characterStatusAtom.reportRead();
    return super.characterStatus;
  }

  @override
  set characterStatus(String value) {
    _$characterStatusAtom.reportWrite(value, super.characterStatus, () {
      super.characterStatus = value;
    });
  }

  late final _$characterColorStatusAtom = Atom(
      name: '_CharacterDetailStore.characterColorStatus', context: context);

  @override
  Color get characterColorStatus {
    _$characterColorStatusAtom.reportRead();
    return super.characterColorStatus;
  }

  @override
  set characterColorStatus(Color value) {
    _$characterColorStatusAtom.reportWrite(value, super.characterColorStatus,
        () {
      super.characterColorStatus = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_CharacterDetailStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$_checkLiveCharacterAsyncAction = AsyncAction(
      '_CharacterDetailStore._checkLiveCharacter',
      context: context);

  @override
  Future<Color> _checkLiveCharacter() {
    return _$_checkLiveCharacterAsyncAction
        .run(() => super._checkLiveCharacter());
  }

  late final _$_checkLiveTextAsyncAction =
      AsyncAction('_CharacterDetailStore._checkLiveText', context: context);

  @override
  Future<String> _checkLiveText() {
    return _$_checkLiveTextAsyncAction.run(() => super._checkLiveText());
  }

  late final _$getCharacterDetailAsyncAction =
      AsyncAction('_CharacterDetailStore.getCharacterDetail', context: context);

  @override
  Future<void> getCharacterDetail() {
    return _$getCharacterDetailAsyncAction
        .run(() => super.getCharacterDetail());
  }

  @override
  String toString() {
    return '''
character: ${character},
characterResult: ${characterResult},
characterStatus: ${characterStatus},
characterColorStatus: ${characterColorStatus},
loading: ${loading}
    ''';
  }
}
