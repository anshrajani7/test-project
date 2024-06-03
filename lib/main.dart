import 'package:fiverr_task/widgets/error_screen.dart';

import 'core/app_export.dart';
import 'core/utils/app_prefs_key.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CommonConstant.instance.dbHelper.initHive();
  ColorConstant();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  ErrorWidget.builder =
      (FlutterErrorDetails details) => AppFlutterErrorScreen(details: details);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final RxBool _isLightTheme = false.obs;

  _getThemeStatus() async {
    bool isLight =
        CommonConstant.instance.dbHelper.box.get(HiveKey.isDarkMode) ?? true;
    _isLightTheme.value = isLight;
    _updateTheme();
  }

  _updateTheme() {
    Get.changeThemeMode(_isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }

  @override
  void initState() {
    _getThemeStatus();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return GetMaterialApp(
      title: AppString.fiverr,
      theme: CustomTheme.lightTheme(context),
      darkTheme: CustomTheme.darkTheme(context),
      themeMode: ThemeMode.system,
      // theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.pages,
      initialRoute: AppRoutes.splashScreenRoute,
    );
  }
}
