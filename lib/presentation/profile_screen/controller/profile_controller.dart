import 'package:fiverr_task/core/app_export.dart';
import 'package:fiverr_task/widgets/custome_image_select.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreenController extends GetxController{
  RxString selectedImagePath = "".obs;

  Future<void> pickImageGallery() async {
    //
    final pickedFile =
    await CustomGalleryDialog.instance.selectImageFromSystem(ImageSource.gallery);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      Get.back();
    } else {
      if (kDebugMode) {
        print('No image selected.');
      }
    }
  }
  Future<void> pickImageCamera() async {
    //
    final pickedFile =
    await CustomGalleryDialog.instance.selectImageFromSystem(ImageSource.camera);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      Get.back();
    } else {
      if (kDebugMode) {
        print('No image selected.');
      }
    }
  }
}