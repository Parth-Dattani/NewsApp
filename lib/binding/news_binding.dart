import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';

class NewsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<NewsController>(NewsController(), permanent: false);
  }

}