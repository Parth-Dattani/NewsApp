import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/base_controller.dart';

import '../model/model.dart';
import '../utils/utils.dart';

class BookMarkController extends BaseController {
  @override
  void onInit() {
    print("Book Mark Controller Init State");
    bookMark();
    super.onInit();
  }

  final TextEditingController searchController = TextEditingController();

  RxString title = ''.obs;
  RxList<Results> bookMarkdList = <Results>[].obs;

  void bookMark() async {
    var result = await sharedPreferencesHelper.retrievePrefData("bookmark_news");
    var list = jsonDecode(result);
    print("list : $list");
    print("list Length : ${list.length}");
    list.map((e) => bookMarkdList.add(Results.fromJson(e))).toList();
    print("book Length : ${bookMarkdList.length}");
    print("bookMark List Data: ${jsonEncode(bookMarkdList.toString())}");
    print("bookMark 00: ${bookMarkdList[0].url ?? ''
    }");
  }
}
