import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/base_controller.dart';
import '../screen/screen.dart';

class MobileOtpController extends BaseController{
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  RxBool otpVisibility = false.obs;
  RxString verificationID = "".obs;
  final TextEditingController mobileController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  @override
  void onInit() {
    phoneController.text =  Get.arguments["mobile"].toString();
    loginWithPhone();
    super.onInit();
  }

  void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: "+91${phoneController.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          debugPrint("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        debugPrint(e.message);
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


  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID.value, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then(
          (value) {
        //setState(() {
        user = FirebaseAuth.instance.currentUser;
        update();
        //});
      },
    ).whenComplete(
          () {
        if (user != null) {
          Fluttertoast.showToast(
            msg: "You are logged in successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );

          //sendDataFirestore(nameController.value.text, auth.currentUser!.email.toString(), "user");

          Get.toNamed(HomeScreen.pageId);

        } else {
          Fluttertoast.showToast(
            msg: "your login is failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
    );
  }
}