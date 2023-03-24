import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_media_signin/flutter_social_media_signin.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app/controller/base_controller.dart';
import 'package:news_app/model/model.dart';

import '../constant/constant.dart';
import '../screen/Country/country_screen.dart';
import '../utils/shared_preferences_helper.dart';

class SignUpController extends BaseController{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  RxBool hidePassword = true.obs;
  // RxBool emailFIllColor = true.obs;
  // RxBool passFIllColor = true.obs;

  RxBool isRemember = false.obs;
  final auth = FirebaseAuth.instance;
  get user => auth.currentUser;
  // Future<void> registerWithValidation() async {
  //   if (signUpFormKey.currentState!.validate()) {
  //     loader.value = true;
  //     signUp(emailController.value.text,passwordController.value.text, );
  //     loader.value = false;
  //   }
  // }


  void signUp(String email, String password) async {
    print("success");
    loader.value = true;
    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      sendDataFirestore(email);
      if (isRemember.value == true ) {
        print("user has lg");
        sharedPreferencesHelper.storePrefData(email, emailController.text);
        sharedPreferencesHelper.storePrefData(password, passwordController.text);
        sharedPreferencesHelper.storeBoolPrefData('isLogin', true);
        //Get.offAndToNamed(HomeScreen.pageId);
      }else {
        sharedPreferencesHelper.storeBoolPrefData('isLogin', false);
      }
      Get.toNamed(CountryScreen.pageId);
    }).catchError((e) {
      Get.snackbar("Error", "$e", backgroundColor: ColorsConfig.colorLightRed,
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
        duration: const Duration(seconds: 2),);
    });

    /*if (user != null) {
      print("user ss");
      // final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      // sharedPreferences.setString('email', email,);
      // sharedPreferences.setString('password', password);
    //  Get.offAndToNamed(HomeScreen.pageId);
    }*/
    loader.value = false;
  }

  Future<void> signInwithGoogle()async {
    var googleAuth = await FlutterSocialMediaSignin().signInWithGoogle();
    await auth
        .signInWithCredential(googleAuth)
        .whenComplete(()async {

        sendDataFirestore(auth.currentUser!.email.toString(),);
        if (isRemember.value == true ) {
          print("user has lg");
          sharedPreferencesHelper.storePrefData('email', emailController.text);
          sharedPreferencesHelper.storePrefData('password', passwordController.text);
          sharedPreferencesHelper.storeBoolPrefData('isLogin', true);
          //Get.offAndToNamed(HomeScreen.pageId);
        }else {
          sharedPreferencesHelper.storeBoolPrefData('isLogin', false);
        }
        Get.toNamed(CountryScreen.pageId);
        }
    );
    print("success");
    print("authf ${auth}");
    //await Get.toNamed(HomeScreen.pageId);
  }

  sendDataFirestore(String email) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    UserResponse userData = UserResponse();
    userData.email = email;
    userData.uid = user!.uid;
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userData.toMap());
  }
}