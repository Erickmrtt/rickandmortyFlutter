import 'package:flutter_modular/flutter_modular.dart';
import 'package:rick_and_morty/Characters/Model/character_model.dart';
import 'package:rick_and_morty/Characters/Repository/character_repository.dart';
import 'package:rick_and_morty/Characters/Screens/Details/character_detail_view.dart';
import 'package:rick_and_morty/Characters/Screens/character_view.dart';
import 'package:rick_and_morty/Common/Utils/strings.dart';

class CharacterModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const CharacterView());
    r.child(Strings.characterDetailsScreen,
        child: (_) => CharacterDetailsScreen(
              character: r.args.data as CharacterResult,
            ));
  }

  @override
  void binds(Injector i) {
    i.addInstance(CharacterRepository());
  }

  @override
  void exportedBinds(Injector i) {}

  @override
  List<Module> get imports => [];
}
