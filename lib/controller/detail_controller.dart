import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/base_controller.dart';

class DetailController extends BaseController{

  RxString section = ''.obs;
  RxString title = ''.obs;
  RxString byLine = ''.obs;
  RxString publishedDate = ''.obs;
  RxString image = ''.obs;
  RxString abstract = ''.obs;

  @override
  void onInit() {
    super.onInit();
    section.value = Get.arguments['section'].toString();
    title.value = Get.arguments['title'].toString();
    byLine.value = Get.arguments['byLine'].toString();
    publishedDate.value = Get.arguments['publishedDate'].toString();
    image.value = Get.arguments['image'].toString();
    abstract.value = Get.arguments['abstract'].toString();
    debugPrint("abstract : ${abstract.value}");
  }
}