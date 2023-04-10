import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/base_controller.dart';
import '../constant/constant.dart';
import '../model/model.dart';
import '../screen/screen.dart';
import '../services/services.dart';
import '../utils/shared_preferences_helper.dart';

class ProfileController extends BaseController
    with GetSingleTickerProviderStateMixin{

  RxList<SelectDrawer> drawerItems = RxList<SelectDrawer>();
  RxBool isDark = false.obs;
  QuerySnapshot? dataStream;
  final auth = FirebaseAuth.instance;
  get user => auth.currentUser;
  RxList<UserResponse> userData = <UserResponse>[].obs;
  //Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  RxString userName = "".obs;
  RxString userId = "".obs;
  RxString bio = ''.obs;
  RxString website = ''.obs;
  RxString imageUrl = ''.obs;

  @override
  void onInit()async {
    getData();
    initDrawerList();
    getNews();
    isDark.value = await sharedPreferencesHelper.retrievePrefBoolData('theme');
    super.onInit();

  }

  RxList<Results> resultDataList = <Results>[].obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  saveThemeStatus() async {
    sharedPreferencesHelper.storeBoolPrefData('theme', isDark.value);
  }

  getThemeStatus(bool val) async {
    var isLight = sharedPreferencesHelper.retrievePrefBoolData('theme');
    isDark.value = (await isLight);
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
   }

  Future<void> getData() async {
    loader.value = true;
    dataStream = await FirebaseFirestore.instance.collection('users').get();
    userData.clear();
    for (var data in dataStream!.docs) {

      if(auth.currentUser!.uid == data['uid']){
        userId.value = data['uid'];
        userName.value = data['userName'].toString();
        bio.value = data["bio"] ?? '';
       imageUrl.value = data['profile'] ?? '';

      }
    }
    loader.value = false;
  }

 /* Future<void> getData() async {
    dataStream = await FirebaseFirestore.instance.collection('users').get();
    userData.clear();
    for (var data in dataStream!.docs) {
      userData.add(UserResponse(
        country: data["country"],
        email: data["email"],
        profile: data["profile"],
        topic: data["topic"],
        uid: data["uid"],
        userName: data["userName"]
      ));
      userName.value = data["userName"];
    }

    loader.value = false;
  }*/


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

  initDrawerList() {
    drawerItems.add(SelectDrawer(
        title: "notification".tr,
        icon: Icons.notifications_paused_outlined,
        action: Image.asset(ImagePath.arrowForwardIcon, scale: 50,),
        selected: false));
    drawerItems.add(SelectDrawer(
        action: Image.asset(ImagePath.arrowForwardIcon, scale: 50),
        title: "security".tr, icon: Icons.lock_open_outlined, selected: false));
    drawerItems.add(SelectDrawer(
        action: Image.asset(ImagePath.arrowForwardIcon, scale: 50),
        title: "help".tr, icon: Icons.help_outline_sharp, selected: false));
    drawerItems.add(SelectDrawer(
        action:
        Obx(
          ()=> Switch(
            value:isDark.value,
            onChanged: (val) {
              isDark.value = val;
              Get.changeThemeMode(
                isDark.value ? ThemeMode.dark : ThemeMode.light,
              );
              saveThemeStatus();
              getThemeStatus(val);
             // Get.changeTheme(val);
            },
          ),
        ),
        title: "dark_mode".tr, icon: Icons.nightlight_round_rounded, selected:  false
    ));
    drawerItems.add(
        SelectDrawer(title: "logout".tr, icon: Icons.logout,
            selected: false));
  }

  drawerOnTap(index) {
    drawerItems[index].selected = !drawerItems[index].selected!;
    drawerItems
        .where((element) => element.title != drawerItems[index].title)
        .map((e) => e.selected = false)
        .toList();
    drawerItems.refresh();
    drawerItems[index].title == "my_profile".tr
        ? Get.toNamed(BookMarkScreen.pageId)
        : drawerItems[index].title == "score_board".tr
        ? Get.toNamed(ExploreScreen.pageId,
      /*arguments: {"loginId": loginId.value}*/)
        : drawerItems[index].title == "change_password".tr
        ? Get.toNamed(
      DetailScreen.pageId,
    )
        : drawerItems[index].title == "logout".tr
        ? logOut()
        : Get.context;
  }
  Future<void> logOut() async {
    const CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    sharedPreferencesHelper.clearPrefData();
    Get.offAllNamed(LoginScreen.pageId);
  }
}

class SelectDrawer {
  String? title;
  IconData? icon;
  Widget? action;
  bool? selected;

  SelectDrawer({this.title, this.icon, this.selected, this.action});
}