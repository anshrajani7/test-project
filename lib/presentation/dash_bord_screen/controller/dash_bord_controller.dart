import 'package:fiverr_task/core/app_export.dart';
import 'package:fiverr_task/presentation/message_screen/message_screen.dart';
import 'package:fiverr_task/presentation/profile_screen/profile_screen.dart';
import 'package:fiverr_task/presentation/setting_screen/setting_screen.dart';

import '../../home_screen/home_screen.dart';

class DashBordScreenController extends GetxController {
  RxInt currentIndex = 0.obs;

  List page = [
    HomeScreen(),
    MessageScreen(),
    SettingScreen(),
    ProfileScreen(),
  ];
  List appBar = [
    AppString.fiverr,
    AppString.inbox,
    AppString.setting,
    AppString.profile,
  ];
  void pageChange(int page) {
    currentIndex.value = page;
  }
}
