import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constant/constant.dart';
import 'package:news_app/controller/base_controller.dart';
import '../model/model.dart';
import '../services/services.dart';
import '../utils/utils.dart';

class HomeController extends BaseController {
  var tabIndex = 0.obs;
  final TextEditingController searchController = TextEditingController();

  RxList<Results> resultDataList = <Results>[].obs;
  RxList<NewsResponse> newsResponse = <NewsResponse>[].obs;
  RxList<Results> bookMarkdList = <Results>[].obs;

  @override
  void onInit() {
    getNews();
    bookMark();
    super.onInit();
  }

  //bottom NavBar Index
  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  Future<void> bookMark() async {
    var result = await sharedPreferencesHelper.retrievePrefData("bookmark_news");
    if (result.isNotEmpty) {
      var list = jsonDecode(result);
      print("list : $list");
      bookMarkdList.clear();
      list.map((e) => bookMarkdList.add(Results.fromJson(e))).toList();
      print("book length : ${bookMarkdList.length}");
      print("bookMark : ${jsonEncode(bookMarkdList)}");
      bookMarkdList.refresh();
    }
  }

  void getNews() async {
    // try {
    loader.value = true;
    var response = await RemoteServices.getNews();
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      var data = jsonData['results'];
      if (data.isNotEmpty) {
        //loader.value = false;
        for (var i in data) {
          resultDataList.add(Results.fromJson(i));
        }
        debugPrint("List : ${resultDataList[0].section}");
        loader.value = false;
      } else {
        loader.value = false;
      }
    }
    // else {
    //   loader.value = false;
    // }
    //}
    // } catch (e) {
    //
    //   debugPrint("Error :- ${e.toString()}");
    // }
  }
}
