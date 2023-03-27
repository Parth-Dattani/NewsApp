import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';

class BookMarkBinding extends Bindings{
  @override
  void dependencies() {
     Get.put<BookMarkController>(BookMarkController(), permanent: false);
  }

}