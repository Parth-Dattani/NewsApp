import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';
import '../../constant/constant.dart';
import '../../utils/utils.dart';
import '../../widgets/widgets.dart';

class MobileOtpScreen extends GetView<MobileOtpController>{
  static const pageId = '/MobileOtpScreen';

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
                  Row(
                    children: [
                      Text('username'.tr, style: CustomTextStyle.labelStyle,),
                      Text('*', style: CustomTextStyle.labelIconStyle,)
                    ],
                  ),
                  const SizedBox(height: 5,),
                  CommonTextField(controller: controller.mobileController,
                    validator: Validator.isEmail,
                    borderRadius: 6,
                    suffixIcon: IconButton(
                      //icon: controller.errorSuffix.value ==  ? Icon(Icons.close) : Icons(Icons.abc),
                      icon: controller.emailFIllColor.value ? IconButton(icon: const Icon(Icons.close),onPressed: (){
                      },)
                          : Container(),
                      onPressed: (){},
                    ),
                    //fillColors: Validator.isEmail.toString() == 'please_enter_email'.tr ? true : false ,
                    //fillColors: controller.emailFIllColor.value,
                    // filled: Validator.isEmail.toString() == '' ? true : false,
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
              //print("Chose Option : ${controller.selectedValue.value} ");
              //Get.toNamed(HomeScreen.pageId);
            },
          ),
        ),
      ),
    );
  }

}