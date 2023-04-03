import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/constant.dart';
import '../../controller/controller.dart';

class SplashScreen extends GetView<SplashController> {
  static const pageId = "/Splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  backgroundColor: ColorsConfig.primaryBackground,
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 320.0),
              child: Center(
                child: Image.asset(
                  ImagePath.appLogo,
                  //width: Get.width,
                  fit: BoxFit.cover,
                  scale: 2,
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
}
