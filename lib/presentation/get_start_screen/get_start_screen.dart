import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:gap/gap.dart';

import '../../core/app_export.dart';
import 'controller/get_start_screen_controller.dart';

class GetStartScreen extends GetWidget<GetStartScreenController> {
  const GetStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor(context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CommonAppbar(
              hasBack: false,
              title: AppString.fiverr,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getWidth(26), vertical: getHeight(25)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppString.fiverrServices,
                      textScaler: const TextScaler.linear(1.0),
                      style: AppStyle.style(getFontSize(28),
                          fontColor: ColorConstant.textBlackToWhite(context),
                          fontWeight: FontWeight.bold),
                    ),
                    Gap(getHeight(80)),
                    Text(
                     AppString.lorem104,
                      textScaler: const TextScaler.linear(1.0),
                      style: AppStyle.style(getFontSize(12),
                          fontColor: ColorConstant.textBlackToWhite(context),
                          fontWeight: FontWeight.bold),
                    ),
                    Gap(getHeight(40)),
                    Row(
                      children: [
                        _commonContainer(
                            text: AppString.findServices,
                            context: context,
                            imagePath: ImageConstant.findServices),
                        Gap(getWidth(14)),
                        _commonContainer(
                            text: AppString.becomeSeller,
                            context: context,
                            imagePath: ImageConstant.seller),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: getWidth(47),
                right: getWidth(47),
                bottom: getHeight(30),
              ),
              child: AppElevatedButton(
                hasBoxShadow: true,
                buttonName: AppString.getStartedCamelCase,
                onPressed: () {
                  Get.toNamed(AppRoutes.loginScreenRoute);
                },
              ),
            ),
          ],
        ));
  }

//commonContainer to use every were
  Widget _commonContainer(
      {required BuildContext context,
      required String imagePath,
      required String text}) {
    return Expanded(
      child: Bounce(
        onTap: () {
          Get.bottomSheet(
              isScrollControlled: true,
              backgroundColor: ColorConstant.backgroundColor(context),
              ignoreSafeArea: false,
              _bottomSheet(context));
        },
        child: Container(
          height: getHeight(140),
          decoration: BoxDecoration(
              color: ColorConstant.containerBackGround(context),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  child: CustomImageView(
                    imagePath: imagePath,
                    fit: BoxFit.fill,
                    border: const Border(
                        bottom: BorderSide(
                            color: ColorConstant.greyDCDC, width: 1)),
                  )),
              const Spacer(),
              Text(
                text,
                style: AppStyle.style(getFontSize(14),
                    fontWeight: FontWeight.w600,
                    fontColor: ColorConstant.textBlackToWhite(context)),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomSheet(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: getHeight(35),
              width: double.maxFinite,
              color: ColorConstant.containerBackGround(context),
            ),
            GestureDetector(
              onTap: (){
                Get.close(1);
              },
              child: Icon(
                Icons.keyboard_arrow_down_sharp,
                color: ColorConstant.textBlackToWhite(context),
                size: getWidth(30),
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.close(1);
              },
              child: Text(
                AppString.goBack,
                style: AppStyle.style(getFontSize(14),
                    fontColor: ColorConstant.textGrey4c4cToWhite(context)),
              ),
            ),
            Gap(getHeight(10)),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppString.chooseServices,
                        textScaler: const TextScaler.linear(1.0),
                        style: AppStyle.style(getFontSize(16),
                            fontColor: ColorConstant.textBlackToWhite(context)),
                      ),
                      Gap(getHeight(25)),
                      Text(
                        AppString.selectAtLeastOne,
                        textScaler: const TextScaler.linear(1.0),
                        style: AppStyle.style(getFontSize(12),
                            fontColor: ColorConstant.textBlackToWhite(context)),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        // Disable scrolling
                        itemCount: 10,
                        itemBuilder: (context, index) => Bounce(
                          onTap: () {
                            controller.rxList[index].toggle();
                          },
                          child: Obx(
                            () => Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: controller.rxList[index].value
                                        ? ColorConstant.primaryGreen
                                        : Colors.transparent,
                                    width: 1.5,
                                  ),
                                  color: ColorConstant.containerBackGround(
                                      context)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.camera,
                                    width: getWidth(50),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 18.0),
                                    child: Divider(
                                      color:
                                          FlexColor.greyLawDarkSecondaryVariant,
                                    ),
                                  ),
                                  Text(
                                    AppString.createSocialMedia,
                                    textAlign: TextAlign.center,
                                    style: AppStyle.style(getFontSize(12),
                                        fontColor:
                                            ColorConstant.textGrey4c4cToWhite(
                                                context)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.1,
                          mainAxisSpacing: getHeight(20),
                          crossAxisSpacing: getWidth(20),
                        ),
                      ),
                      Gap(getHeight(60))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: getHeight(55),
          width: double.maxFinite,
          color: ColorConstant.backgroundColor(context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => AppElevatedButton(
                buttonName:
                    controller.rxList.any((value) => value.value == true)
                        ? AppString.continueText
                        : AppString.skip,
                onPressed: () {
                  Get.toNamed(AppRoutes.loginScreenRoute);
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
