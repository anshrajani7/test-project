import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fiverr_task/core/app_export.dart';

import '../core/utils/progress_dialog_utils.dart';

// For checking internet connectivity
abstract class NetworkInfo {
  static Future<bool> checkNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      Get.closeAllSnackbars();
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      Get.closeAllSnackbars();
      return true;
    } else {
      if (connectivityResult == ConnectivityResult.none) {
        ProgressDialogUtils.hideProgressDialog();
        Get.snackbar("ERROR MESSAGE".tr, "NO INTERNET CONNECTION".tr,
            backgroundColor: ColorConstant.primaryBlue,
            snackPosition: SnackPosition.BOTTOM);
        checkNetwork();
        return false;
      } else {
        return true;
      }
    }
  }
}
