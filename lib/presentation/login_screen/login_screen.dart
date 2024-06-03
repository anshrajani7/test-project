import 'package:fiverr_task/core/app_export.dart';
import 'package:fiverr_task/presentation/login_screen/controller/login_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class LoginScreen extends GetWidget<LoginScreenController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(
        hasBack: false,
        title: AppString.fiverr,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(15)),
          child: Column(
            children: [
              Gap(getHeight(35)),
              Obx(
                () => CustomTextFormFiled(
                  text: AppString.name,
                  hintText: AppString.enterName,
                  onChange: (p0) {
                    if (p0.isEmpty) {
                      controller.rxList[0].value = true;
                    } else {
                      controller.rxList[0].value = false;
                    }
                  },
                  isEmpty: controller.rxList[0].value,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                  controller: controller.nameController,
                ),
              ),
              Gap(getHeight(20)),
              Obx(
                () => CustomTextFormFiled(
                  text: AppString.phoneNumber,
                  hintText: AppString.enterPhone,
                  onChange: (p0) {
                    if (p0.isEmpty) {
                      controller.rxList[1].value = true;
                    } else {
                      controller.rxList[1].value = false;
                    }
                  },
                  isEmpty: controller.rxList[1].value,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.phone,
                  controller: controller.mobileController,
                ),
              ),
              Gap(getHeight(20)),
              Obx(
                () => CustomTextFormFiled(
                  text: AppString.email,
                  hintText: AppString.enterEmail,
                  onChange: (p0) {
                    if (p0.isEmpty) {
                      controller.rxList[2].value = true;
                    } else {
                      controller.rxList[2].value = false;
                    }
                  },
                  isEmpty: controller.rxList[2].value,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress,
                  controller: controller.emailController,
                ),
              ),
              Gap(getHeight(20)),
              Obx(
                () => CustomTextFormFiled(
                  text: AppString.password,
                  hintText: AppString.enterPassword,
                  onChange: (p0) {
                    if (p0.isEmpty) {
                      controller.rxList[3].value = true;
                    } else {
                      controller.rxList[3].value = false;
                    }
                  },
                  isObscureText: controller.isVisible.value ? false : true,
                  suffixIcons: IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () {
                        controller.iSVisibleFun();
                      },
                      icon: Icon(
                        controller.isVisible.value
                            ? CupertinoIcons.eye
                            : CupertinoIcons.eye_slash,
                        color: ColorConstant.grey9DA,
                      )),
                  isEmpty: controller.rxList[3].value,
                  textInputAction: TextInputAction.next,
                  controller: controller.passwordController,
                ),
              ),
              Gap(getHeight(20)),
              Obx(
                () => CustomTextFormFiled(
                  text: AppString.confirmPassword,
                  hintText: AppString.enterConfirmPassword,
                  isObscureText: true,
                  onChange: (p0) {
                    if (p0.isEmpty) {
                      controller.rxList[4].value = true;
                    } else {
                      controller.rxList[4].value = false;
                    }
                  },
                  isEmpty: controller.rxList[4].value,
                  textInputAction: TextInputAction.done,
                  controller: controller.confirmPasswordController,
                ),
              ),
              Gap(getHeight(65)),
              AppElevatedButton(
                buttonName: AppString.login,
                onPressed: () {
                  controller.isLogin();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
