import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<ProfileController>(ProfileController());
  }

}