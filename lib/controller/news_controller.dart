import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:news_app/controller/base_controller.dart';
import 'package:get/get.dart';
import 'package:news_app/model/model.dart';
import '../services/services.dart';

class NewsController extends BaseController
    with GetSingleTickerProviderStateMixin {
  final GlobalKey<FormState> newsForm = GlobalKey<FormState>();
  late TabController tabController =
      TabController(vsync: this, length: tabList.length, initialIndex: 0);

  RxList<String> tabList = <String>[
    "home",
    "arts",
    "automobiles",
    "books",
    "business",
    "fashion",
    "food",
    "health",
    "insider",
    "magazine",
    "movies",
    "nyregion",
    "obituaries",
    "opinion",
    "politics",
    "realestate",
    "science",
    "sundayreview",
    "technology",
    "theater",
    "t-magazine",
    "upshot",
    "us",
    "world",
  ].obs;

  RxList<Results> resultDataList = <Results>[].obs;
  List<String> newsName = <String>[];
  String? category = 'home';

  @override
  void onInit() {
    //getNews();
    categoryNews(category);
    super.onInit();
  }

  void categoryNews(category) async {
    try {
      resultDataList.clear();
      loader.value = true;
      var response = await RemoteServices.categoryNews(category);
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

        //newsResponse.value =  NewsResponse.fromJson(jsonData);

        var data = jsonData['results'];
        if (data.isNotEmpty) {
          loader.value = false;
          for (var i in data) {
            resultDataList.add(Results.fromJson(i));
          }
          //newsResponse.value = NewsResponse.fromJson(jsonData as Map<String, dynamic>);
          print("List : ${resultDataList[0].section}");
          loader.value = false;
        } else {
          loader.value = false;
        }
      }
    } catch (e) {
      print("Error :- ${e.toString()}");
    }
  }


  void getNews() async {
    try {
      loader.value = true;
      var response = await RemoteServices.getNews();
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

        //newsResponse.value =  NewsResponse.fromJson(jsonData);

        var data = jsonData['results'];
        if (data.isNotEmpty) {
          loader.value = false;
          for (var i in data) {
            resultDataList.add(Results.fromJson(i));
          }
          //newsResponse.value = NewsResponse.fromJson(jsonData as Map<String, dynamic>);
          debugPrint("List : ${resultDataList[0].section}");
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
