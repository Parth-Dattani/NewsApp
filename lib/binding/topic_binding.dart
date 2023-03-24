import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';

class TopicBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<TopicController>(TopicController(), permanent: false);
  }

}