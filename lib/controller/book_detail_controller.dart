import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/base_controller.dart';

import '../model/model.dart';
import '../services/services.dart';

class BookDetailController extends BaseController{

  RxList<Books> bookDetailsList = <Books>[].obs;
  String? date = '';
  String? listName = '';

  @override
  void onInit() {
    super.onInit();

    listName = Get.arguments['listName'];
    date = Get.arguments['date'];
    getBookDetails(date, listName);
  }

  void getBookDetails(date, listName) async {
     try {
    //resultDataList.clear();
    loader.value = true;
    var response = await RemoteServices.getBookDetails(date, listName);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);

      var data = jsonData['results']['books'];
      if (data.isNotEmpty) {
        for (var i in data) {
          bookDetailsList.add(Books.fromJson(i));
        }

        print("Book Name of Display: ${bookDetailsList[0].title}");
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