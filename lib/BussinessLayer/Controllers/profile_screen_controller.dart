import 'package:captin_app/BussinessLayer/Helpers/image_picker_helper.dart';
import 'package:get/get.dart';

class ProfileScreenController {
  ImagePickerHelper imagePickerHelper = ImagePickerHelper();
  RxString selectedUserImage = ''.obs;

  Future<void> getSelectedUserImage() async {
    selectedUserImage.value = await imagePickerHelper.pickImage();
  }
}
