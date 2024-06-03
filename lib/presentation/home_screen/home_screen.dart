import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import '../../core/app_export.dart';
import 'controller/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenController controller = Get.put(HomeScreenController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(getHeight(15)),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: getWidth(15)),
              child: Container(
                height: getHeight(47),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: ColorConstant.containerBackGround(context)),
                child: Row(
                  children: [
                    Gap(getWidth(10)),
                    Icon(
                      Icons.search_rounded,
                      size: getWidth(20),
                      color: ColorConstant.textGrey4c4cToWhite(context),
                    ),
                    Gap(getWidth(15)),
                    Text(
                      AppString.searchServices,
                      style: AppStyle.style(getFontSize(14),
                          fontColor:
                              ColorConstant.textGrey4c4cToWhite(context)),
                    )
                  ],
                ),
              ),
            ),
            Gap(getHeight(25)),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: getWidth(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.popularServices,
                    style: AppStyle.style(getFontSize(18),
                        fontColor:
                            ColorConstant.textPrimaryBlackToWhite(context),
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    AppString.seeAll,
                    style: AppStyle.style(getFontSize(12),
                        fontColor: ColorConstant.textBlackToGreen(context),
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            SizedBox(
              height: getHeight(170),
              width: double.maxFinite,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Bounce(
                      onTap: () {},
                      child: Container(
                        width: getWidth(120),
                        decoration: BoxDecoration(
                          color: ColorConstant.containerBackGround(context),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    topLeft: Radius.circular(12)),
                                child: CustomImageView(
                                  height: getHeight(95),
                                  fit: BoxFit.fill,
                                  imagePath: ImageConstant.findServices,
                                )),
                            const Spacer(),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getWidth(10)),
                              child: Text(
                                AppString.logoDesign,
                                style: AppStyle.style(getFontSize(14),
                                    fontColor:
                                        ColorConstant.textPrimaryBlackToWhite(
                                            context),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 15,
              ),
            ),
            Gap(getHeight(25)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.recentlyViewedMore,
                    style: AppStyle.style(getFontSize(18),
                        fontColor:
                            ColorConstant.textPrimaryBlackToWhite(context),
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    AppString.seeAll,
                    style: AppStyle.style(getFontSize(12),
                        fontColor: ColorConstant.textBlackToGreen(context),
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            SizedBox(
              height: getHeight(280),
              width: double.maxFinite,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Bounce(
                      onTap: () {},
                      child: Container(
                        width: getWidth(210),
                        decoration: BoxDecoration(
                          color: ColorConstant.containerBackGround(context),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    topLeft: Radius.circular(12)),
                                child: CustomImageView(
                                  fit: BoxFit.fill,
                                  imagePath: ImageConstant.findServices,
                                )),
                            Gap(getHeight(10)),
                            Row(
                              children: [
                                Gap(getWidth(10)),
                                CircleAvatar(
                                  backgroundColor: ColorConstant.greyE6E6,
                                  backgroundImage: AssetImage(
                                    ImageConstant.userImage,
                                  ),
                                  maxRadius: 15,
                                ),
                                Gap(getWidth(10)),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppString.ajayKumar,
                                      style: AppStyle.style(getFontSize(10),
                                          fontColor: ColorConstant
                                              .textPrimaryBlackToWhite(
                                                  context)),
                                    ),
                                    Text(AppString.topRatedSeller,
                                        style: AppStyle.style(getFontSize(10),
                                            fontColor: ColorConstant.textGreyToWhite(context))),
                                  ],
                                ),
                                Gap(getWidth(40)),
                                const Icon(CupertinoIcons.heart)
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getWidth(10),
                                  vertical: getHeight(10)),
                              child: Text(
                                AppString.lorem34,
                                style: AppStyle.style(getFontSize(10),
                                    fontColor:
                                        ColorConstant.textPrimaryBlackToWhite(
                                            context)),
                              ),
                            ),
                            Row(children: [
                              Gap(getWidth(10)),
                              Icon(Icons.star,size: getWidth(15),),
                              Gap(getWidth(5)),
                               Text('4.0',style: AppStyle.style(getFontSize(10),fontColor: ColorConstant.textPrimaryBlackToWhite(context)),),
                              Gap(getWidth(5)),
                               Text('(3990)',style: AppStyle.style(getFontSize(10),fontColor: ColorConstant.textGreyToWhite(context))),
                              Gap(getWidth(40)),
                              Text('From',style: AppStyle.style(getFontSize(10),fontColor: ColorConstant.textBlackToWhite(context))),
                              Gap(getWidth(5)),
                              Text('\u{20B9}33,930',style: AppStyle.style(getFontSize(10),fontColor: ColorConstant.textBlackToWhite(context))),
                            ],)
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 15,
              ),
            )
          ],
        ),
      );
  }
}
