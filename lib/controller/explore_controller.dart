import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/base_controller.dart';
import 'package:news_app/model/book_response.dart';
import '../services/services.dart';

class ExploreController extends BaseController {
  RxList<BookResults> bookList = <BookResults>[].obs;
  RxBool isSave = false.obs;

  RxList<String> tabList = <String>[
    "home".tr,
    "art".tr,
    "automobiles".tr,
    "books".tr,
    "business".tr,
    "fashion".tr,
    "food".tr,
    "health".tr,
    "insider".tr,
    "magazine".tr,
    "movies".tr,
    "nyregion".tr,
    "obituaries".tr,
    "opinion".tr,
    "politics".tr,
    "realestate".tr,
    "science".tr,
    "sunday_review".tr,
    "technology".tr,
    "theater".tr,
    "t_magazine".tr,
    "upshot".tr,
    "us".tr,
    "world".tr,
  ].obs;

  @override
  void onInit() {
    getBookList();
    super.onInit();
  }

  void getBookList() async {
    try {
      loader.value = true;
      var response = await RemoteServices.getBookList();
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

        //newsResponse.value =  NewsResponse.fromJson(jsonData) as List<NewsResponse>;

        var data = jsonData['results'];
        if (data.isNotEmpty) {
          for (var i in data) {
            bookList.add(BookResults.fromJson(i));
          }
          debugPrint("Book List :  ${bookList[0].listName}");
          debugPrint("Book List length:  ${bookList.length}");
          loader.value = false;
        } else {
          loader.value = false;
        }
      }
    } catch (e) {
      debugPrint("Error :- ${e.toString()}");
    }
  }
}
