
import 'package:fiverr_task/core/app_export.dart';
import 'package:fiverr_task/presentation/dash_bord_screen/controller/dash_bord_controller.dart';

class DashBordScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashBordScreenController());
  }
}