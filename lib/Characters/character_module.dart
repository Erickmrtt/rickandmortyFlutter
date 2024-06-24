import 'package:flutter_modular/flutter_modular.dart';
import 'package:rick_and_morty/Characters/Repository/character_repository.dart';
import 'package:rick_and_morty/Characters/Screens/character_view.dart';

class CharacterModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const CharacterView());
  }

  @override
  void binds(Injector i) {}

  @override
  void exportedBinds(Injector i) {
    i.addInstance(CharacterRepository());
  }

  @override
  List<Module> get imports => [];
}
