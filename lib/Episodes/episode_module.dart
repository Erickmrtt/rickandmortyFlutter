import 'package:flutter_modular/flutter_modular.dart';
import 'package:rick_and_morty/Episodes/Screens/episode_view.dart';

class EpisodeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const EpisodeView());
  }

  @override
  void binds(Injector i) {}

  @override
  void exportedBinds(Injector i) {}

  @override
  List<Module> get imports => [];
}