import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:news_app/constant/constant.dart';
import 'package:news_app/controller/controller.dart';
import 'package:news_app/widgets/common_loader.dart';
import 'package:news_app/widgets/common_text_field.dart';

import '../../utils/utils.dart';
import '../../widgets/common_button.dart';
import '../screen.dart';

class LoginScreen extends GetView<LoginController>{
  static const pageId = "/LoginScreen";

  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=>
            CommonLoader(
                isLoad: controller.loader.value,
            body: Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 35, left: 25, right: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("hello".tr, style: CustomTextStyle.helloTextStyle,),
                        Text("again".tr, style: CustomTextStyle.againTextStyle,),
                        Text("welcome_back_youve_been_missed".tr, style: CustomTextStyle.loginSubTitleStyle,),
                        Padding(
                          padding: const EdgeInsets.only(top: 48, bottom: 16),
                          child: Form(
                              key: controller.loginForm,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('username'.tr, style: CustomTextStyle.labelStyle,),
                                      Text('*', style: CustomTextStyle.labelIconStyle,)
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                 CommonTextField(controller: controller.emailController,
                                        validator: Validator.isEmail,
                                        borderRadius: 6,
                                        suffixIcon: IconButton(
                                          //icon: controller.errorSuffix.value ==  ? Icon(Icons.close) : Icons(Icons.abc),
                                          icon: controller.emailFIllColor.value ? IconButton(icon: Icon(Icons.close),onPressed: (){
                                          },)
                                              : Container(),
                                          onPressed: (){},
                                        ),
                                      //fillColors: Validator.isEmail.toString() == 'please_enter_email'.tr ? true : false ,
                                      fillColors: controller.emailFIllColor.value,
                                      // filled: Validator.isEmail.toString() == '' ? true : false,
                                      ),

                                  const SizedBox(height: 15,),
                                  Row(
                                    children: [
                                      Text('password'.tr,style: CustomTextStyle.labelStyle,),
                                      Text('*',style: CustomTextStyle.labelIconStyle,)
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                  CommonTextField(controller: controller.passwordController,
                                      validator: Validator.isPassword,
                                      borderRadius: 6,
                                      suffixIcon:
                                      IconButton(
                                        icon: controller.hidePassword.value ? const Icon(Icons.visibility_off)
                                            : const Icon(Icons.visibility),
                                        onPressed: () {
                                          controller.hidePassword.value = !controller.hidePassword.value;
                                        },
                                      ),
                                      fillColors: controller.passFIllColor.value,
                                      isObscure: controller.hidePassword.value,
                                      /*IconButton(icon: Icon(Icons.remove_red_eye) ,onPressed: (){}),*/
                                    ),

                                  const SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                           Theme(
                                             data: ThemeData(unselectedWidgetColor: ColorsConfig.colorBlack),
                                          child:
                                            Checkbox(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(3),
                                              ),
                                              value: controller.isRemember.value,
                                              checkColor:ColorsConfig.colorWhite,

                                              activeColor: ColorsConfig.colorBlue,
                                              onChanged: (value) {
                                                //setState(() {
                                                    controller.isRemember.value = value!;
                                                  //},);
                                              },
                                            ),
                                          ),
                                          Text("remember_me".tr, style: CustomTextStyle.labelStyle,)
                                        ],
                                      ),
                                      CommonButton(
                                        name: "forgot_the_password".tr,
                                        border: false,
                                        textStyle: CustomTextStyle.forgotButton,
                                        onPress: (){
                                          // Get.toNamed(ForgotPasswordScreen.pageId);
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 18,),
                                  CommonButton(
                                    name: 'login'.tr,
                                    color: ColorsConfig.colorBlue,
                                    textStyle: CustomTextStyle.buttonStyle,
                                    borderRadius: 6,
                                    border: false,
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                    onPress: (){
                                      FocusScope.of(context).unfocus();
                                      if(controller.loginForm.currentState!.validate()){
                                        print("valid");
                                        controller.login(controller.emailController.text, controller.passwordController.text);

                                      }
                                      else{
                                      // if(Validator.isEmail.toString() == 'Please Enter Email'){
                                      //controller.emailFIllColor.value = true;
                                      print("inValid ${Validator.isEmail.toString()}");


                                      //controller.passFIllColor.value = true;
                                      // controller.errorSuffix.value = false;
                                      // }
                                      print("esl;es");
                                      }
                                    },
                                  ),
                                ],
                              )),
                        ),
                        Center(
                          child: Text("or_continue_with".tr, style: CustomTextStyle.labelStyle,),
                        ),
                        const SizedBox(height: 16,),
                        CommonButton(
                          name: 'google'.tr,
                          minWidth: 250,
                          image: ImagePath.googleIcon,
                          scale: 15,
                          color: ColorsConfig.colorLightGray,
                          textStyle: CustomTextStyle.googleButtonStyle,
                          borderRadius: 6,
                          border: false,
                          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                          onPress: (){
                            controller.signInwithGoogle();
                          },
                        ),
                        const SizedBox(height: 16,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('dont_have_an_account'.tr, style: CustomTextStyle.labelStyle,),
                            TextButton(  onPressed: () {
                              Get.offAndToNamed(SignUpScreen.pageId);
                            },
                                child: Text('sign_up'.tr, style: CustomTextStyle.signUpText, ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            )
    );
  }

}