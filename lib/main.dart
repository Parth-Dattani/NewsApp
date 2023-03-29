import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';
import 'package:news_app/utils/common.dart';
import 'package:news_app/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constant/constant.dart';
import 'routs.dart';
import 'screen/screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPreferencesHelper.getSharedPreferencesInstance();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key}){
     getThemeStatus();
   }


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'News App',
        theme: Common().lightTheme,
        darkTheme: Common().darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.pageId,
        getPages: appPage,
        translations: Language(),
        locale: const Locale('en', 'US'),
        fallbackLocale: const Locale('en', 'US')
    );
  }

}

RxBool isLightTheme = true.obs;
Future<SharedPreferences> prefs = SharedPreferences.getInstance();

 getThemeStatus() async {
  var isLight = prefs.then((SharedPreferences prefs) {
    return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
  }).obs;
  isLightTheme.value = (await isLight.value)!;
  Get.changeThemeMode(isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
}