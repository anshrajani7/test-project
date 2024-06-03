import 'package:fiverr_task/core/app_export.dart';
import 'package:fiverr_task/presentation/dash_bord_screen/controller/dash_bord_controller.dart';
import 'package:flutter/cupertino.dart';

class DashBordScreen extends GetWidget<DashBordScreenController> {
  const DashBordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return Scaffold(
        appBar: CommonAppbar(
          hasBack: false,
          changeTitle: Obx(
            () => Text(
              controller.appBar[controller.currentIndex.value],
              style: AppStyle.style(getFontSize(26),
                  fontWeight: FontWeight.w700,
                  fontColor: ColorConstant.textBlackToWhite(context)),
            ),
          ),
        ),
        body: Obx(
          () => controller.page[controller.currentIndex.value],
        ),
        bottomNavigationBar: Container(
          height: getHeight(55),
          // color: ColorConstant.primaryOrg.withOpacity(0.3),
          decoration: BoxDecoration(
            color: ColorConstant.containerBackGround(context),
          ),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _bottomAppBarItem(
                    icon: CupertinoIcons.home,
                    page: 0,
                    context: context,
                    tag: AppString.home),
                _bottomAppBarItem(
                    icon: CupertinoIcons.mail,
                    page: 1,
                    context: context,
                    tag: AppString.inbox),
                _bottomAppBarItem(
                    icon: CupertinoIcons.settings,
                    page: 2,
                    context: context,
                    tag: AppString.setting),
                _bottomAppBarItem(
                    icon: CupertinoIcons.profile_circled,
                    page: 3,
                    tag: AppString.account,
                    context: context),
              ],
            ),
          ),
        ));
  }

  Widget _bottomAppBarItem(
      {required IconData icon,
      required int page,
      required BuildContext context,
      required String tag}) {
    return Bounce(
      onTap: () {
        controller.pageChange(page);
      },
      child: IconButton(
          tooltip: tag,
          onPressed: null,
          icon: Icon(
            icon,
            color: controller.currentIndex.value == page
                ? ColorConstant.primaryGreen
                : ColorConstant.textPrimaryBlackToWhite(context),
          )),
    );
  }
}
