import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../screen/screen.dart';
import '../utils/shared_preferences_helper.dart';
import 'controller.dart';

class SplashController extends BaseController {

  void errorHandler(e) {}

  @override
  void onInit() {
    Timer(const Duration(seconds: 5), checkLogin);
    super.onInit();
  }

  void checkLogin() async {
    debugPrint("hello ${await sharedPreferencesHelper.retrievePrefBoolData('isLogin')}");
    switch (
    await sharedPreferencesHelper.retrievePrefBoolData('isLogin')) {
      case true:
        return Get.offAndToNamed(HomeScreen.pageId);
      case false:
        return Get.offAndToNamed(OnBoardScreen.pageId);
    }
  }
}
