import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/common.dart';
import 'package:news_app/utils/utils.dart';
import 'constant/constant.dart';
import 'routs.dart';
import 'screen/screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPreferencesHelper.getSharedPreferencesInstance();
  await Firebase.initializeApp();
  runApp(MyApp());
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

 getThemeStatus() async {
  bool isDark = await sharedPreferencesHelper.retrievePrefBoolData('theme');
  Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
}