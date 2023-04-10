import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';

class Validator {
  static final controller = Get.find<BaseController>();

  static String emailString=r"^[a-zA-Z0-9_.\-]+@[a-zA-Z0-9_.\-]+\.[a-zA-Z]+";

  static String? isEmail(String? email) {
    if (email!.isEmpty) {
      return 'please_enter_email'.tr;
    } else if (!RegExp(emailString).hasMatch(email)) {
      return 'not_valid_email_address'.tr;
    }
    return null;
  }

  // static String? isEmail(email) {
  //   if (email.toString().trim().isEmpty) {
  //     //controller.emailFIllColor.value = true;
  //     return 'please_enter_email'.tr;
  //   }
  //   //controller.emailFIllColor.value = false;
  //   return null;
  // }

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
    if (phone.isEmpty) {
      return 'please_enter_phone'.tr;
    }
    else if (phone.length != 10) {
      return 'phone_number_must_be_10_digit'.tr;
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
