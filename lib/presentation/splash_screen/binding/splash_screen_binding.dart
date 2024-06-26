
import 'package:fiverr_task/core/app_export.dart';

import '../controller/splash_screen_controller.dart';


class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
  }
}
