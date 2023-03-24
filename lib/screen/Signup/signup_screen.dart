import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../utils/utils.dart';
import '../../widgets/widgets.dart';
import '../screen.dart';

class SignUpScreen extends GetView<SignUpController>{
  static const pageId = "/SignUpScreen";

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
            ()=> CommonLoader(
              isLoad: controller.loader.value,
              body: Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 35, left: 25, right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("hello!".tr, style: CustomTextStyle.againTextStyle,),
                          Text("signup_to_get_started".tr, style: CustomTextStyle.loginSubTitleStyle,),
                          Padding(
                            padding: const EdgeInsets.only(top: 48, bottom: 16),
                            child: Form(
                                key: controller.signUpFormKey,
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
                                      //fillColors: controller.emailFIllColor.value,
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
                                      validator: Validator.isEmail,
                                      borderRadius: 6,
                                      //fillColors: controller.passFIllColor.value,
                                      suffixIcon:
                                      IconButton(
                                        icon: controller.hidePassword.value ? const Icon(Icons.visibility_off)
                                            : const Icon(Icons.visibility),
                                        onPressed: () {
                                          controller.hidePassword.value = !controller.hidePassword.value;
                                        },
                                      ),
                                      isObscure: controller.hidePassword.value,
                                    ),
                                    const SizedBox(height: 10,),
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

                                    const SizedBox(height: 18,),
                                    CommonButton(
                                      name: 'sign_up'.tr,
                                      color: ColorsConfig.colorBlue,
                                      textStyle: CustomTextStyle.buttonStyle,
                                      borderRadius: 6,
                                      border: false,
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                      onPress: (){
                                        FocusScope.of(context).unfocus();
                                        if(controller.signUpFormKey.currentState!.validate()){
                                          controller.signUp(controller.emailController.text, controller.passwordController.text);                                        }
                                        else{
                                          print("inValid");
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
                              Text('already_have_an_account'.tr, style: CustomTextStyle.labelStyle,),
                              TextButton(  onPressed: () {
                                Get.offAndToNamed(LoginScreen.pageId);
                              },
                                  child: Text('login'.tr, style: CustomTextStyle.signUpText, ))
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