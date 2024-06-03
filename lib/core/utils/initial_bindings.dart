
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fiverr_task/core/app_export.dart';
import 'package:fiverr_task/core/network/network_info.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Connectivity connectivity = Connectivity();

    Get.put(NetworkInfo(connectivity));
  }
}
