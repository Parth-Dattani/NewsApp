import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';

class Validator {
  static final controller = Get.find<LoginController>();

  static String? isEmail(email) {
    if (email.toString().trim().isEmpty) {
      controller.emailFIllColor.value = true;
      return 'please_enter_email'.tr;
    }
    controller.emailFIllColor.value = false;
    return null;
  }

  static String? isPassword(password) {
    if (password.toString().trim().isEmpty) {
      controller.passFIllColor.value = true;
      return 'please_enter_password'.tr;
    }
    controller.passFIllColor.value = false;
    return null;
  }

  static String? isConfirmPassword(password) {
    if (password.toString().trim().isEmpty) {
      return 'please_enter_password'.tr;
    }
    return null;
  }
}
