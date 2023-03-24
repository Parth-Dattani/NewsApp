import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';

class ExploreBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<ExploreController>(ExploreController(), permanent: false);
  }

}