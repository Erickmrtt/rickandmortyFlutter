import 'package:flutter_modular/flutter_modular.dart';
import 'package:rick_and_morty/Characters/character_module.dart';
import 'package:rick_and_morty/Common/Utils/strings.dart';
import 'package:rick_and_morty/Episodes/episode_module.dart';
import 'package:rick_and_morty/Locations/locations_module.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: CharacterModule());
    r.module(Strings.locationsModule, module: LocationsModule());
    r.module(Strings.episodesModule, module: EpisodeModule());
  }

  @override
  void binds(Injector i) {}

  @override
  void exportedBinds(Injector i) {}

  @override
  List<Module> get imports => [];
}
