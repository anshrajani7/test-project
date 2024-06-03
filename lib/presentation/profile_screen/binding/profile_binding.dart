import 'package:fiverr_task/core/app_export.dart';
import 'package:fiverr_task/presentation/profile_screen/controller/profile_controller.dart';

class ProfileScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileScreenController());
  }
}