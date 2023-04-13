import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/base_controller.dart';
import 'package:news_app/model/model.dart';
import 'package:news_app/utils/common.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/shared_preferences_helper.dart';

class DetailController extends BaseController{

  RxString section = ''.obs;
  RxString title = ''.obs;
  RxString byLine = ''.obs;
  RxString publishedDate = ''.obs;
  RxString image = ''.obs;
  RxString abstract = ''.obs;
  RxBool isBookMark = false.obs;
  RxList<Results> bookMarkdList = <Results>[].obs;
  var favData=Rx<List<String>>([]);
  List<String> bookmarked = [];

  @override
  Future<void> onInit() async {
    bookMark();
    section.value = Get.arguments['section'].toString();
    title.value = Get.arguments['title'].toString();
    byLine.value = Get.arguments['byLine'].toString();
    publishedDate.value = Get.arguments['publishedDate'].toString();
    image.value = Get.arguments['image'];
    abstract.value = Get.arguments['abstract'].toString();
    debugPrint("Image : ${image.value}");
    print("book Liskbf S.p ${bookmarked}");
    super.onInit();
  }

  //get sharedPreference Data
  Future<void> bookMark() async {
    var result = await sharedPreferencesHelper.retrievePrefData("bookmark_news");
   if(result.isNotEmpty){
     var list = jsonDecode(result);
     debugPrint("list : $list");
     debugPrint("listlength : ${list.length}");
     list.map((e) => bookMarkdList.add(Results.fromJson(e))).toList();
     debugPrint("book length : ${bookMarkdList.length}");
     debugPrint("bookMark : ${jsonEncode(bookMarkdList)}");
   }
  }

}