import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    //Get.put<LoginController>(LoginController(), permanent: false);
    Get.lazyPut(() => LoginController());
  }
}