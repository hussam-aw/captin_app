import 'package:captin_app/DataAccesslayer/Clients/box_client.dart';
import 'package:captin_app/DataAccesslayer/Models/user.dart';
import 'package:captin_app/DataAccesslayer/Repositories/user_repo.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/snackbars.dart';
import 'package:captin_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String selectedUserImagePath = '';
  UserRepo userRepo = UserRepo();
  BoxClient client = BoxClient();
  var isLoading = false.obs;

  void setSelectedUserImagePath(path) {
    selectedUserImagePath = path;
  }

  void setUserName(name) {
    if (name.isNotEmpty) {
      userNameController.value = TextEditingValue(text: name);
    } else {
      userNameController.clear();
    }
  }

  String getUserName() {
    return userNameController.value.text;
  }

  void setMobilePhone(mobilePhone) {
    if (mobilePhone.isNotEmpty) {
      mobileNumberController.value = TextEditingValue(text: mobilePhone);
    } else {
      mobileNumberController.clear();
    }
  }

  String getMobilePhone() {
    return mobileNumberController.value.text;
  }

  void setPassword(password) {
    if (password.isNotEmpty) {
      passwordController.value = TextEditingValue(text: password);
    } else {
      passwordController.clear();
    }
  }

  String getPassword() {
    return passwordController.value.text;
  }

  void setUserDetails(User? user) {
    if (user != null) {
      setUserName(user.name);
      setMobilePhone(user.phone);
      setPassword('');
    } else {
      setUserName('');
      setMobilePhone('');
      setPassword('');
    }
  }

  Future<void> updateProfile() async {
    String userName = getUserName();
    String mobilePhone = getMobilePhone();
    String password = getPassword();
    if (userName.isNotEmpty && mobilePhone.isNotEmpty && password.isNotEmpty) {
      isLoading.value = true;
      var user = await userRepo.updateUserInfo(
        userName,
        mobilePhone,
        password,
        selectedUserImagePath,
      );
      isLoading.value = false;
      if (user != null) {
        MyApp.appUser = user;
        setUserDetails(MyApp.appUser);
        await client.setAuthedUser(MyApp.appUser!);
        update();
        SnackBars.showSuccess('تم تعديل بيانات الملف الشخصي');
      } else {
        SnackBars.showError('فشل التعديل');
      }
    } else {
      SnackBars.showWarning('يرجى تعبئة الحقول المطلوبة');
    }
  }

  @override
  void onInit() {
    setUserDetails(MyApp.appUser);
    super.onInit();
  }
}
