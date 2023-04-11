import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/base_controller.dart';
import '../model/model.dart';
import '../services/services.dart';
import '../utils/utils.dart';

class HomeController extends BaseController{
  var tabIndex = 0.obs;
  final TextEditingController searchController = TextEditingController();

  RxList<Results> resultDataList = <Results>[].obs;
  RxList<NewsResponse> newsResponse = <NewsResponse>[].obs;
  RxList<Results> bookMarkdList = <Results>[].obs;
  RxList<Results> searchList = <Results>[].obs;

  @override
  void onInit() {
    getNews();
  //  bookMarkNews();
   super.onInit();
  }

  //bottom NavBar Index
  void changeTabIndex(int index) {
    tabIndex.value = index;
  }


  void bookMarkNews()async{
    var result = await sharedPreferencesHelper.retrievePrefData('bookmark_news');
    debugPrint("book mard list : $result");
    var list = jsonDecode(result);
    //print("list : $list");
    list.map((e) => bookMarkdList.add(Results.fromJson(e))).toList();
    print("book length : ${bookMarkdList.length}");
    print("bookMark : ${jsonEncode(bookMarkdList)}");
  }

  void getNews() async  {
    resultDataList.clear();
    searchList.clear();
      loader.value = true;
      var response = await RemoteServices.getNews();
      if (response.statusCode == 200) {

        var jsonData = json.decode(response.body);
          var data = jsonData['results'];
          if (data.isNotEmpty) {
            for (var i in data) {
              resultDataList.add(Results.fromJson(i));
            }
            debugPrint("List : ${resultDataList[0].section}");
            loader.value = false;
          } else {
            loader.value = false;
          }
          searchList.addAll(resultDataList);
        }
  }

 /* List<Results> searchNews(key) {
    debugPrint("Check Search Key $key");

    if (key.toString().isNotEmpty) {
      resultDataList.value = resultDataList
          .where((p0) => p0.title!.toLowerCase().contains(key.toLowerCase()))
          .toList();

      resultDataList.map((element) => debugPrint("search : ${element.title}")).toList();
    } else {
      //searchList.clear();
      resultDataList.addAll(searchList);
    }
    return resultDataList;
  }*/

  void filterNews(key) {
    var results = <Results>[];
    if (key.isEmpty) {
      results = resultDataList;
    } else {
      results = resultDataList
          .where((element) => element.title
          .toString()
          .toLowerCase()
          .contains(key.toLowerCase()))
          .toList();
    }
    searchList.value = results;
  }

}

