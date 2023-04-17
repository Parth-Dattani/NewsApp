import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';
import 'package:news_app/screen/ForgotPassword/mobile_otp_screen.dart';
import '../../constant/constant.dart';
import '../../utils/utils.dart';
import '../../widgets/widgets.dart';

class EmailOtpScreen extends GetView<EmailOtpController>{
  static const pageId = '/EmailOtpScreen';

  const EmailOtpScreen({super.key});

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
                  Text(controller.selectedOption.value.toString() == "Via SMS:" ? "Mobile number" : "Email ID"  , style: CustomTextStyle.labelStyle,),
                  const SizedBox(height: 5,),
                  Obx(()=>CommonTextField(controller: controller.emailController,
                      validator: Validator.isEmail,
                      keyboardType: controller.selectedOption.value.toString() == "Via SMS:" ? TextInputType.number : TextInputType.text,
                      borderRadius: 6,
                      maxLength: controller.selectedOption.value.toString() == "Via SMS:" ? 10  : null,
                      suffixIcon: IconButton(
                        //icon: controller.errorSuffix.value ==  ? Icon(Icons.close) : Icons(Icons.abc),
                        icon: controller.emailFIllColor.value ? IconButton(icon: const Icon(Icons.close),onPressed: (){
                        },)
                            : Container(),
                        onPressed: (){},
                      ),
                      onChanged: (value){
                        controller.email.value = value;
                      },
                    ),
                  ),
                  // Visibility(
                  //   visible: controller.otpVisibility.value,
                  //   child:  TextField(
                  //     controller: controller.otpController,
                  //     decoration: const InputDecoration(
                  //       hintText: 'OTP',
                  //       prefix: Padding(
                  //         padding: EdgeInsets.all(4),
                  //         child: Text(''),
                  //       ),
                  //     ),
                  //     maxLength: 6,
                  //     keyboardType: TextInputType.number,
                  //   ),
                  // ),
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
            onPress: () async {
              FocusScope.of(context).unfocus();
              controller.selectedOption.value == "Via SMS:" ?
                  Get.toNamed(MobileOtpScreen.pageId,
                  arguments: {"mobile" : controller.emailController.text}
                  ) :
               await   controller.emailSend(context);
            },
          ),
        ),
      ),
    );
  }
}