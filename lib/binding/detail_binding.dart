import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';

class DetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<DetailController>(DetailController(), permanent: false);
  }
  
}