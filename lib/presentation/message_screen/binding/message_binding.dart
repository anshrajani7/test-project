import 'package:fiverr_task/core/app_export.dart';
import 'package:fiverr_task/presentation/message_screen/controller/message_controller.dart';

class MessageScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageScreenController());
  }
}