import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

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
      accentColor: Colors.red,
      brightness: Brightness.dark,
      primaryColor: Colors.amber,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.amber,
        disabledColor: Colors.grey,
      ));

  ThemeData lightTheme = ThemeData(
      accentColor: Colors.pink,
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.blue,
        disabledColor: Colors.grey,
      ));

}