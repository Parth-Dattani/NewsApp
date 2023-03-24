import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/base_controller.dart';

import '../model/model.dart';
import '../services/services.dart';

class HomeController extends BaseController{
  RxInt currentIndex = 0.obs;
  final TextEditingController searchController = TextEditingController();

  RxList<Results> resultDataList = <Results>[].obs;

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