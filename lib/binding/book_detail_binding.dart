import 'package:get/get.dart';
import 'package:news_app/controller/book_detail_controller.dart';

class BookDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<BookDetailController>(BookDetailController());
  }

}