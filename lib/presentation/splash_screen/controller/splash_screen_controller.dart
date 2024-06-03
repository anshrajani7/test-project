import 'dart:async';

import 'package:fiverr_task/core/app_export.dart';


class SplashScreenController extends GetxController {
  @override
  void onInit() {
    changeRoute();
    super.onInit();
  }

  Future changeRoute() async {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offAllNamed(AppRoutes.getStartScreenRoute);
    });
  }
}
