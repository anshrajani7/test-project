
import 'package:fiverr_task/core/app_export.dart';

class GetStartScreenController extends GetxController {
  var rxList = RxList<RxBool>.of(RxList.generate(10, (index) => false.obs));
}