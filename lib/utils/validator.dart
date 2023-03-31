import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';

class Validator {
  static final controller = Get.find<BaseController>();

  static String? isEmail(email) {
    if (email.toString().trim().isEmpty) {
      //controller.emailFIllColor.value = true;
      return 'please_enter_email'.tr;
    }
    //controller.emailFIllColor.value = false;
    return null;
  }

  static String? isUserName(userName) {
    if (userName.toString().trim().isEmpty) {
      return 'please_enter_username'.tr;
    }
    return null;
  }

  static String? isFullName(fullName) {
    if (fullName.toString().trim().isEmpty) {
      return 'please_enter_fullname'.tr;
    }
    return null;
  }

  static String? isPhone(phone) {
    if (phone.toString().trim().isEmpty) {
      return 'please_enter_phone'.tr;
    }
    return null;
  }

  static String? isPassword(password) {
    if (password.toString().trim().isEmpty) {
      controller.passFIllColor.value = true;
      return 'please_enter_password'.tr;
    }
    //controller.passFIllColor.value = false;
    return null;
  }

  static String? isConfirmPassword(password) {
    if (password.toString().trim().isEmpty) {
      return 'please_enter_password'.tr;
    }
    return null;
  }
}
