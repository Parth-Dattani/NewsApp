import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:news_app/controller/base_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends BaseController{

  RxBool isLightTheme = true.obs;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();


  saveThemeStatus() async {
    SharedPreferences pref = await prefs;
    pref.setBool('theme', isLightTheme.value);
  }

  getThemeStatus() async {
    var _isLight = prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
    }).obs;
    isLightTheme.value = (await _isLight.value)!;
    Get.changeThemeMode(isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }
}