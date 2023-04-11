import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';

class ForgotPasswordBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<ForgotPasswordController>(ForgotPasswordController(), permanent: false);
  }

}