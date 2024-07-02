import 'package:flutter_modular/flutter_modular.dart';
import 'package:rick_and_morty/Locations/Screens/locations_view.dart';

class LocationsModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const LocationsView());
  }

  @override
  void binds(Injector i) {}

  @override
  void exportedBinds(Injector i) {}

  @override
  List<Module> get imports => [];
}