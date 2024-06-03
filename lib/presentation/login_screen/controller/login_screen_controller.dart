import 'package:fiverr_task/core/app_export.dart';

class LoginScreenController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var rxList = RxList<RxBool>.of(RxList.generate(5, (index) => false.obs));
  RxBool isVisible = false.obs;
  RxBool check = false.obs;
  void iSVisibleFun() {
    isVisible.toggle();
  }
  void isLogin() {
    rxList.assignAll([
      nameController.text.isEmpty.obs,
      mobileController.text.isEmpty.obs,
      emailController.text.isEmpty.obs,
      passwordController.text.isEmpty.obs,
      confirmPasswordController.text.isEmpty.obs,
    ]);

    if (rxList.any((value) => value.value == true)) {
      // At least one field is empty
      // Additional logic to handle empty fields if needed
      if (kDebugMode) {
        print("At least one field is empty");
      }
    } else {
      // All fields are filled
      if (kDebugMode) {
        print("All fields are filled");
      }
      // Navigate to the next screen here
      Get.toNamed(AppRoutes.dashBordScreenRoute);
    }
  }
}