import 'package:get/get.dart';
import 'package:news_app/controller/congratulate_controller.dart';

class CongratulateBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<CongratulateController>(CongratulateController(), permanent: false);
  }

}