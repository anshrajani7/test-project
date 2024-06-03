import '../core/app_export.dart';


/// Screen For replacement of flutter red error Screen
class AppFlutterErrorScreen extends StatelessWidget {
  final FlutterErrorDetails details;
  const AppFlutterErrorScreen({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: getHeight(150),
                    child: Lottie.asset(
                        'assets/animation/error_cat_animation.json')),
                const SizedBox(height: 20),
                Text(
                  details.exceptionAsString(),
                  // style: AppStyle.txtGilroySemiBold,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
