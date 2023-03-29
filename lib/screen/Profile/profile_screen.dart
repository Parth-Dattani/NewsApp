import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';
import '../../constant/constant.dart';

class ProfileScreen extends GetView<ProfileController>{
  static const pageId ="/ProfileScreen";

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 24, bottom: 15, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("explore".tr, style: CustomTextStyle.titleHeadStyle,),
              const SizedBox(height: 15,),
               Obx(
                 ()=> Switch(
                    value: controller.isLightTheme.value,
                    onChanged: (val) {
                      controller.isLightTheme.value = val;
                      Get.changeThemeMode(
                        controller.isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
                      );
                      controller.saveThemeStatus();
                    },
                  ),
               ),

            ],
          ),
        ),
      ),
    );
  }
}
