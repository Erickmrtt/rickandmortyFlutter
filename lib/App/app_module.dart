import 'package:flutter_modular/flutter_modular.dart';
import 'package:rick_and_morty/Characters/character_module.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: CharacterModule());
  }

  @override
  void binds(Injector i) {}

  @override
  void exportedBinds(Injector i) {}

  @override
  List<Module> get imports => [];
}
