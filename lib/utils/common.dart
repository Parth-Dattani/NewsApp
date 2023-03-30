import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:news_app/constant/color_config.dart';
import 'package:news_app/constant/text_style.dart';

import '../widgets/widgets.dart';

class Common{
  static void getSnackBar(String title, String description,
      {int duration = 2, SnackPosition position = SnackPosition.BOTTOM}) {
    Get.snackbar(title, description,
        snackPosition: position, duration: Duration(seconds: duration));
  }

  Future<bool> willPopCallback(context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CommonDialog(
            text: "Confirm to Quite App",
            onYesPress: () {
              SystemNavigator.pop();
            },
            onNoPress: () {
              Navigator.of(context).pop();
            },
          );
        });
    return false;
  }

  ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: ColorsConfig.colorBlack,

      textTheme: const TextTheme(
        displaySmall: TextStyle(color: ColorsConfig.colorDarkGray,),
        displayMedium: TextStyle(color: ColorsConfig.colorWhite,),
        displayLarge: TextStyle(color: ColorsConfig.colorWhite,),

        labelSmall :  TextStyle(color: ColorsConfig.colorWhite,),
        labelMedium :  TextStyle(color: ColorsConfig.colorWhite,),
        labelLarge :  TextStyle(color: ColorsConfig.colorWhite,),
      ),


      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: ColorsConfig.colorWhite,
        ),
        backgroundColor: ColorsConfig.colorBlack,
          titleTextStyle: TextStyle(color: ColorsConfig.colorWhite)
      ),



      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.amber,
        disabledColor: Colors.grey,
      ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsConfig.colorBlack,
      unselectedItemColor: ColorsConfig.colorMixGray,
    ),
      scaffoldBackgroundColor: ColorsConfig.colorBlack,
    drawerTheme: DrawerThemeData(
      backgroundColor: ColorsConfig.colorBlack,
    )

  );

  ThemeData lightTheme = ThemeData(
      accentColor: Colors.pink,
      brightness: Brightness.light,
      primaryColor: Colors.white,
      textTheme: const TextTheme(
        displaySmall : TextStyle(color: ColorsConfig.colorBlack,),
        displayMedium : TextStyle(color: ColorsConfig.colorBlack,),
        displayLarge: TextStyle(color: ColorsConfig.colorBlack,),
        labelMedium :  TextStyle(color: ColorsConfig.colorBlack,),
        labelLarge :  TextStyle(color: ColorsConfig.colorBlack,),

      ),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: ColorsConfig.colorBlack,
        ),
          backgroundColor: ColorsConfig.colorWhite,
          titleTextStyle: TextStyle(color: ColorsConfig.colorBlack)
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.blue,
        disabledColor: Colors.grey,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ColorsConfig.colorWhite,
          unselectedItemColor: ColorsConfig.colorMixGray,
      ),
    scaffoldBackgroundColor: ColorsConfig.colorWhite,

      drawerTheme: DrawerThemeData(
        backgroundColor: ColorsConfig.colorWhite,
      )
  );


}