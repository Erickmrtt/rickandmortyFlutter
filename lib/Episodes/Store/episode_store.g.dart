// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EpisodeStore on _EpisodeStore, Store {
  late final _$episodesAtom =
      Atom(name: '_EpisodeStore.episodes', context: context);

  @override
  List<EpisodeResult> get episodes {
    _$episodesAtom.reportRead();
    return super.episodes;
  }

  @override
  set episodes(List<EpisodeResult> value) {
    _$episodesAtom.reportWrite(value, super.episodes, () {
      super.episodes = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_EpisodeStore.loading', context: context);

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

  late final _$getEpisodesAsyncAction =
      AsyncAction('_EpisodeStore.getEpisodes', context: context);

  @override
  Future<void> getEpisodes() {
    return _$getEpisodesAsyncAction.run(() => super.getEpisodes());
  }

  late final _$_EpisodeStoreActionController =
      ActionController(name: '_EpisodeStore', context: context);

  @override
  String formatAirDate(int index) {
    final _$actionInfo = _$_EpisodeStoreActionController.startAction(
        name: '_EpisodeStore.formatAirDate');
    try {
      return super.formatAirDate(index);
    } finally {
      _$_EpisodeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String numberEpisodes() {
    final _$actionInfo = _$_EpisodeStoreActionController.startAction(
        name: '_EpisodeStore.numberEpisodes');
    try {
      return super.numberEpisodes();
    } finally {
      _$_EpisodeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
episodes: ${episodes},
loading: ${loading}
    ''';
  }
}
