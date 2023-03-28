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

  RxList<Results> resultDataList = <Results>[].obs;
  List<String> newsName = <String>[];

  @override
  void onInit() {
    getNews();
    super.onInit();
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
