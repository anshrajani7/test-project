
import 'package:fiverr_task/core/app_export.dart';

import '../controller/setting_screen_controller.dart';

class SettingScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingScreenController());
  }
}
