import 'package:flutter_modular/flutter_modular.dart';
import 'package:rick_and_morty/Episodes/Screens/episode_view.dart';
import 'package:rick_and_morty/Episodes/Store/episode_store.dart';

class EpisodeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const EpisodeView());
  }

  @override
  void binds(Injector i) {
    i.addInstance(EpisodeStore());
  }

  @override
  void exportedBinds(Injector i) {}

  @override
  List<Module> get imports => [];
}