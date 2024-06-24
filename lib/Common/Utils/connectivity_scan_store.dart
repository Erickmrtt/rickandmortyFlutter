import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mobx/mobx.dart';

part 'connectivity_scan_store.g.dart';

class ConnectivtyScanStore = ConnectivtyScanStoreContract
    with _$ConnectivtyScanStore;

abstract class ConnectivtyScanStoreContract with Store {
  @observable
  ObservableStream<List<ConnectivityResult>> connectivityResult =
      ObservableStream(Connectivity().onConnectivityChanged);
  void dispose() {}
}
