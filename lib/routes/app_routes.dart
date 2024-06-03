import 'package:fiverr_task/presentation/dash_bord_screen/binding/dash_bord_binding.dart';
import 'package:fiverr_task/presentation/dash_bord_screen/dash_bord_screen.dart';
import 'package:fiverr_task/presentation/login_screen/binding/login_creen_binding.dart';
import 'package:fiverr_task/presentation/login_screen/login_screen.dart';
import 'package:fiverr_task/presentation/profile_screen/binding/profile_binding.dart';
import 'package:fiverr_task/presentation/profile_screen/profile_screen.dart';
import 'package:fiverr_task/presentation/setting_screen/binding/setting_screen_binding.dart';
import 'package:fiverr_task/presentation/setting_screen/setting_screen.dart';
import 'package:get/get.dart';
import '../presentation/get_start_screen/binding/get_start_screen_binding.dart';
import '../presentation/get_start_screen/get_start_screen.dart';
import '../presentation/home_screen/binding/home_screen_binding.dart';
import '../presentation/home_screen/home_screen.dart';
import '../presentation/splash_screen/binding/splash_screen_binding.dart';
import '../presentation/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splashScreenRoute = '/splash_screen';
  static const String getStartScreenRoute = '/get_start_screen';
  static const String homeScreenRoute = '/home_screen';
  static const String settingScreenRoute = '/setting_screen';
  static const String loginScreenRoute = '/login_screen';
  static const String dashBordScreenRoute = '/dash_bord_screen';
  static const String profileScreenRoute = '/profile_screen';


  static List<GetPage> pages = [
    GetPage(
        name: splashScreenRoute,
        page: () => const SplashScreen(),
        bindings: [
          SplashScreenBinding(),
        ],
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 200)),
    GetPage(
        name: getStartScreenRoute,
        page: () => const GetStartScreen(),
        bindings: [
          GetStartScreenBinding(),
        ],
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 200)),
    GetPage(
        name: loginScreenRoute,
        page: () => const LoginScreen(),
        bindings: [
          LoginScreenBinding(),
        ],
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 200)),
    GetPage(
        name: dashBordScreenRoute,
        page: () => const DashBordScreen(),
        bindings: [
          DashBordScreenBinding(),
        ],
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 200)),
    GetPage(
        name: homeScreenRoute,
        page: () =>  HomeScreen(),
        bindings: [
          HomeScreenBinding(),
        ],),
    GetPage(
        name: settingScreenRoute,
        page: () =>  SettingScreen(),
        bindings: [
          SettingScreenBinding(),
        ],
      ),
    GetPage(
      name: profileScreenRoute,
      page: () =>  ProfileScreen(),
      bindings: [
        ProfileScreenBinding(),
      ],
    ),

  ];
}
