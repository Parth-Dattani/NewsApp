import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/base_controller.dart';
import '../model/model.dart';
import '../utils/utils.dart';

class BookMarkController extends BaseController {
  @override
  void onInit() {
    bookMark();
    super.onInit();
  }

  final TextEditingController searchController = TextEditingController();

  RxString title = ''.obs;
  RxList<Results> bookMarkdList = <Results>[].obs;
  RxList<Results> searchList = <Results>[].obs;

  Future<void> bookMark() async {
    var result = await sharedPreferencesHelper.retrievePrefData('bookmark_news');
    if(result.isNotEmpty){
      var list = jsonDecode(result);
      list.map((e) => bookMarkdList.add(Results.fromJson(e))).toList();
      debugPrint("book Length : ${bookMarkdList.length}");
      debugPrint("bookMark List Data: ${jsonEncode(bookMarkdList.toString())}");
      searchList.addAll(bookMarkdList);
    }
  }

  void filterNews(key) {
    var results = <Results>[];
    if (key.isEmpty) {
      results = bookMarkdList;
    } else {
      results = bookMarkdList
          .where((element) => element.title
          .toString()
          .toLowerCase()
          .contains(key.toLowerCase()))
          .toList();

      print('Result List : ${jsonEncode(results)}');
    }
    searchList.value = results;
  }
}
