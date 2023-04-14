import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';
import '../../constant/constant.dart';
import '../../widgets/widgets.dart';
import '../screen.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController>{
  static const pageId = '/ForgotPasswordScreen';

  const ForgotPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Scaffold(
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
                    Text("forgot".tr, style: CustomTextStyle.congratulateTextStyle,),
                    Text("${"password".tr}?", style: CustomTextStyle.congratulateTextStyle,),
                    const SizedBox(height: 5,),
                    Text("Don’t worry! it happens. Please select the email or number associated with your account.", style: CustomTextStyle.accountTextStyle,),
                    const SizedBox(height: 15,),

                    ListView.separated(
                      itemCount: controller.title.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Obx(
                          ()=> CustomRadioButton(
                                title: controller.title[index],
                                //subTitle: controller.subTitle[index],
                                groupValue: controller.selectedValue.value,
                                value: controller.title[index],
                                onChange: (value) {
                                  controller.selectedValue.value = value;
                                },

                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 15.0),
                    ),
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
              print("Chose Option : ${controller.selectedValue.value.toString()} ");
              //controller.selectedValue.value == "Via Email:" ?
              Get.toNamed(EmailOtpScreen.pageId,
                  arguments: {
                    "option" : controller.selectedValue.value.toString(),
                    // "isForgot": controller.isForgot.value = true,
                    // "isPhone": controller.isPhone.value = false,
                  }
              );
              //: Get.toNamed(MobileOtpScreen.pageId);
            },
          ),
        ),
      ),
    );
  }

}