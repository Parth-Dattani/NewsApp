import 'package:get/get.dart';
import 'package:news_app/controller/signup_controller.dart';

class SignUpBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<SignUpController>(SignUpController(), permanent: false);
  }

}