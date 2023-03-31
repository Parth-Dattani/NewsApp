import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/congratulate_controller.dart';
import 'package:news_app/screen/Home/home_screen.dart';
import '../../constant/constant.dart';
import '../../widgets/widgets.dart';

class CongratulateScreen extends GetView<CongratulateController>{
  static const pageId = "/CongratulateScreen";

  const CongratulateScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConfig.colorWhite,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                ImagePath.appLogo,
                //width: Get.width,
                fit: BoxFit.cover,
                scale: 2,
              ),
            ),
            const SizedBox(height: 70,),
            Text("congratulations".tr, style: CustomTextStyle.congratulateTextStyle,),
            const SizedBox(height: 8),
            Text("your_account_is_ready_to_use".tr, style: CustomTextStyle.accountTextStyle,)
          ],

        ),
      ),
      bottomNavigationBar: Container(
        height: Get.height * 0.12,
        decoration: const BoxDecoration(
          color: ColorsConfig.colorWhite,
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: CommonButton(
          name: 'go_to_homepage'.tr,
          color: ColorsConfig.colorBlue,
          textStyle: CustomTextStyle.buttonStyle,
          borderRadius: 6,
          border: false,
          onPress: () {
            FocusScope.of(context).unfocus();
            Get.toNamed(HomeScreen.pageId);
          },
        ),
      ),
    );

  }

}