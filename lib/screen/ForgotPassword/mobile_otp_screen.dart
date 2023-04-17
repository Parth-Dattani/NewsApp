import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';
import '../../constant/constant.dart';
import '../../widgets/widgets.dart';

class MobileOtpScreen extends GetView<MobileOtpController>{
  static const pageId = '/MobileOtpScreen';

  const MobileOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          leadingIcon: ImagePath.arrowBack,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("OTP Verification".tr, style: CustomTextStyle.congratulateTextStyle,textAlign: TextAlign.center),
                  const SizedBox(height: 5,),
                  Text("Enter the OTP sent to +91 ${controller.phoneController.text}", style: CustomTextStyle.accountTextStyle,),
                  const SizedBox(height: 15,),
              TextField(
                    controller: controller.otpController,
                    decoration: const InputDecoration(
                      hintText: 'OTP',
                      prefix: Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(''),
                      ),
                    ),
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 5,),
                ],
              ),
            ),
          ),
        ),

        bottomNavigationBar: Container(
          height: Get.height * 0.12,
          decoration: const BoxDecoration(
            color: ColorsConfig.colorWhite,
          ),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: CommonButton(
            name: 'submit'.tr,
            color: ColorsConfig.colorBlue,
            textStyle: CustomTextStyle.buttonStyle,
            borderRadius: 6,
            border: false,
            onPress: () {
              FocusScope.of(context).unfocus();
              //print("Chose Option : ${controller.selectedValue.value} ");
              //Get.toNamed(HomeScreen.pageId);
              controller.verifyOTP();
            },
          ),
        ),
      );
  }

}