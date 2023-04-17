import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/base_controller.dart';
import 'package:news_app/screen/ForgotPassword/mobile_otp_screen.dart';

class EmailOtpController extends BaseController{
  //RxString selectedValue = "Via Email :".obs;

  final TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  RxBool isForgot = false.obs;
  RxBool isPhone = false.obs;
  RxString selectedOption = "".obs;
  RxBool otpVisibility = false.obs;
  RxString email = "".obs;
  //RxString selectedValue = "".obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  RxString verificationID = "".obs;

  @override
  void onInit() {
    // isForgot.value = Get.arguments["isForgot"];
    // isPhone.value = Get.arguments["isPhone"];
    selectedOption.value = Get.arguments["option"].toString();
    print("option value : ${selectedOption.value}");
    super.onInit();
  }

  Future<void> emailSend(context) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.value).whenComplete(
          () => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "An email has been send ${email.value} to please verify",
          ),
        ),
      ),
    );
    Get.back();
    Get.back();
  }

  void loginWithPhone() async {
    Get.toNamed(MobileOtpScreen.pageId);
    auth.verifyPhoneNumber(
      phoneNumber: "+91${emailController.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility.value = true;
        verificationID.value = verificationId ;
        update();
        // setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

}