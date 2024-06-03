import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../core/app_export.dart';
class CustomGalleryDialog{

  CustomGalleryDialog._();

  static final instance = CustomGalleryDialog._();

  Future<bool> requestFilePermission() async {
    late AndroidDeviceInfo androidInfo;
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      try {
        androidInfo = await deviceInfo.androidInfo;
        if (kDebugMode) {
          print(androidInfo.version.sdkInt);
        }
      } catch (e) {
        if (kDebugMode) {
          print('Failed to get Android device info: $e');
        }
      }
    }
    PermissionStatus result;
    PermissionStatus resultAudio;
    if (Platform.isAndroid) {
      if (androidInfo.version.sdkInt >= 33) {
        result = await Permission.photos.request();
        resultAudio = await Permission.audio.request();
      } else {
        result = await Permission.storage.request();
        resultAudio = await Permission.audio.request();
      }
      if (androidInfo.version.sdkInt >= 33) {
        if (result.isGranted && resultAudio.isGranted) {
          return true;
        }
      } else {
        if (result.isGranted) {
          return true;
        }
      }
    } else {
      result = await Permission.photos.request();
      if (result.isGranted) {
        return true;
      }
    }
    return false;
  }

  CustomCupertinoBottomDilouge({
    String? headText,
    required String firstText,
    Color secondTextColor = ColorConstant.primaryGreen,
    required Function firstTextOnTap,
    String? secondText,
    Function? secondTextOnTap,
    Function? cancelButtonTap,
    required BuildContext context,
  }) {
    final action = CupertinoActionSheet(
      actions: [
        if (headText != null)
          CupertinoActionSheetAction(onPressed: () {}, child: Text(headText),),
        Container(
          color: ColorConstant.containerBackGround(context),
          child: CupertinoActionSheetAction(
              isDefaultAction: true,
              onPressed: () {
                firstTextOnTap.call();
              },
              child: Text(
                firstText,
                style: AppStyle.style(getFontSize(16),fontColor: ColorConstant.primaryGreen,fontWeight: FontWeight.w600),
              )),
        ),
        if (secondText != null || secondTextOnTap != null)
          Container(
            color: ColorConstant.containerBackGround(context),
            child: CupertinoActionSheetAction(
                isDefaultAction: true,
                onPressed: () {
                  secondTextOnTap!.call();
                },
                child: Text(secondText ?? '',
                    style: AppStyle.style(getFontSize(16),fontColor: ColorConstant.primaryGreen,fontWeight: FontWeight.w600),)),
          ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text('Cancel',
            style: AppStyle.style(getFontSize(16),fontColor: ColorConstant.primaryGreen,fontWeight: FontWeight.w600),),
        onPressed: () {
          Get.back();
        },
      ),
    );
    showCupertinoModalPopup(
        context: context,
        builder: (context) => action,
        barrierColor: ColorConstant.primaryBlack.withOpacity(0.5));
  }

  Future<XFile?> selectImageFromSystem(
      ImageSource imageSource,
      ) async {
    if (imageSource == ImageSource.gallery) {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(

        source: ImageSource.gallery,imageQuality: 50,
        preferredCameraDevice: CameraDevice.front,

      );
      return pickedFile;
    } else if (imageSource == ImageSource.camera) {
      try {
        final picker = ImagePicker();
        final pickedFile = await picker.pickImage(
          source: ImageSource.camera,imageQuality: 50,
          preferredCameraDevice: CameraDevice.rear,
        );
        return pickedFile;
      } catch (e) {
        var status = await Permission.camera.status;
        if (status.isDenied ||
            status.isPermanentlyDenied ||
            status.isRestricted) {
          CustomCupertinoAlertDilouge(
              context: Get.context!,
              Header: "camera permission",
              subTitle: "camera permission",
              yesButtonText: "Yes",
              noButtonText: AppString.cancel,
              yesButtonColor: ColorConstant.primaryGreen,
              yesButtonTap: () {
                Get.back();
                openAppSettings();
              });
        } else {
          if (kDebugMode) {
            print('$e');
          }
        }
      }
    }
    return null;
  }

  CustomCupertinoAlertDilouge(
      {required BuildContext context,
        required String Header,
        required String subTitle,
        required String yesButtonText,
        Color? yesButtonColor,
        required String noButtonText,
        required Function yesButtonTap,
        String? title}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Column(
              children: <Widget>[
                Text(Header),
                if (title != null) Text(title),
              ],
            ),
            content: Column(
              children: [
                SizedBox(
                  height: getHeight(10),
                ),
                Text(subTitle)
              ],
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context); //close Dialog
                  },
                  child: const Text(AppString.cancel)),
              TextButton(
                  onPressed: () {
                    yesButtonTap.call();
                  },
                  child: const Text("Yes")),
            ],
          );
        });
  }

}