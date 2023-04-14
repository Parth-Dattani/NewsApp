import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';

class EmailOtpBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<EmailOtpController>(EmailOtpController(), permanent: false);
  }

}