import 'package:get/get.dart';
import 'package:news_app/controller/onboard_controller.dart';

class OnBoardBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<OnBoardController>(OnBoardController(), permanent: false);
  }
}