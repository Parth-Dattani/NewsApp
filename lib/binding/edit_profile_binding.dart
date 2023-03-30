import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';

class EditProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<EditProfileController>(EditProfileController());
  }

}