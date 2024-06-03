import 'dart:io';

import 'package:fiverr_task/core/app_export.dart';
import 'package:fiverr_task/presentation/profile_screen/controller/profile_controller.dart';
import 'package:fiverr_task/widgets/custome_image_select.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileScreenController controller = Get.put(ProfileScreenController());

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(getHeight(20)),
          Center(
            child: Bounce(
                onTap: () async {
                  FocusScope.of(context).unfocus();
                  CustomGalleryDialog.instance.CustomCupertinoBottomDilouge(
                    firstText: AppString.gallery,
                    firstTextOnTap: () {
                      controller.pickImageGallery();
                    },
                    context: context,
                    secondText: AppString.camera,
                    secondTextOnTap: () {
                      controller.pickImageCamera();
                    },
                  );
                },
                child: Stack(children: [
                  imageCircle(context),
                  Positioned(
                      bottom: getHeight(5),
                      right: 2,
                      child: CircleAvatar(
                          radius: getWidth(12),
                          backgroundColor: ColorConstant.primaryGreen,
                          child: Icon(
                            Icons.edit,
                            size: getHeight(15),
                            color: ColorConstant.primaryWhite,
                          ))),
                ])),
          ),
          Gap(getHeight(20)),
          Center(
            child: Text(
              AppString.ajayKumar,
              style: AppStyle.style(getFontSize(18),
                  fontColor: ColorConstant.textBlackToWhite(context),
                  fontWeight: FontWeight.w700),
            ),
          ),
          Gap(getHeight(10)),
          Container(
            height: 0.7,
            width: double.maxFinite,
            color: FlexColor.greyLawDarkPrimary,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getWidth(15), vertical: getHeight(15)),
            child: Text(
              AppString.myFiverr,
              style: AppStyle.style(getFontSize(16),
                  fontColor: ColorConstant.textBlackToWhite(context),
                  fontWeight: FontWeight.w700),
            ),
          ),
          _listTile(
              context: context,
              title: AppString.getInspired,
              iconData: Icons.diamond_outlined),
          _listTile(
            iconData: CupertinoIcons.heart,
            title: AppString.savesLists,
            context: context,
          ),
          _listTile(
              context: context,
              title: AppString.myInterests,
              iconData: Icons.bookmarks_outlined),
          _listTile(
              iconData: Icons.share,
              title: AppString.inviteFriends,
              context: context),
          Container(
            height: 0.7,
            width: double.maxFinite,
            color: FlexColor.greyLawDarkPrimary,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getWidth(15), vertical: getHeight(15)),
            child: Text(
              AppString.settings,
              style: AppStyle.style(getFontSize(16),
                  fontColor: ColorConstant.textBlackToWhite(context),
                  fontWeight: FontWeight.w700),
            ),
          ),
          _listTile(
              context: context,
              title: AppString.preference,
              iconData: Icons.settings),
          _listTile(
            iconData: CupertinoIcons.profile_circled,
            title: AppString.account,
            context: context,
          ),
        ],
      ),
    );
  }

  Widget imageCircle(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: getHeight(100),
      width: getHeight(100),
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 10,
            spreadRadius: 1,
            color: ColorConstant.greyDCDC)
      ], shape: BoxShape.circle, color: Colors.white),
      child: controller.selectedImagePath.isNotEmpty
          ? Obx(
              () => Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(
                              File(controller.selectedImagePath.value)),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle,
                      color: Colors.blueGrey)),
            )
          : CustomImageView(
              radius: BorderRadius.circular(50),
              fit: BoxFit.cover,
              imagePath: ImageConstant.userImage,
            ),
    );
  }

  Widget _listTile(
      {required BuildContext context,
      required String title,
      required IconData iconData}) {
    return Bounce(
      onTap: () {},
      child: Column(
        children: [
          Container(
            height: 0.7,
            width: double.maxFinite,
            color: FlexColor.greyLawDarkPrimary,
          ),
          Container(
            color: ColorConstant.containerBackGround(context),
            child: ListTile(
              trailing: Icon(
                CupertinoIcons.right_chevron,
                size: getHeight(20),
                color: ColorConstant.textGreyToWhite(context),
              ),
              title: Text(
                title,
                style: AppStyle.style(getFontSize(14),
                    fontColor: ColorConstant.textBlackToWhite(context),
                    fontWeight: FontWeight.w500),
              ),
              leading: Icon(
                iconData,
                size: getHeight(25),
                color: ColorConstant.textGreyToWhite(context),
              ),
            ),
          ),
          Container(
            height: 0.4,
            width: double.maxFinite,
            color: FlexColor.greyLawDarkPrimary,
          )
        ],
      ),
    );
  }
}
