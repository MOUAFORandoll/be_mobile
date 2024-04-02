import 'package:connectivity/connectivity.dart';

abstract class INetworkInfo {
  Future<bool> checkConnection();
}

class NetworkInfo implements INetworkInfo {
  Connectivity connectivity;
  NetworkInfo({required this.connectivity});

  @override
  Future<bool> checkConnection() async {
    var connectivityResult = await (connectivity.checkConnectivity());
    final userHasWifi = (connectivityResult == ConnectivityResult.wifi);
    final userHasMobileData = (connectivityResult == ConnectivityResult.mobile);
    return userHasWifi || userHasMobileData;
  }
}
