import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_media_signin/flutter_social_media_signin.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/base_controller.dart';
import 'package:news_app/screen/screen.dart';
import '../constant/constant.dart';
import '../model/model.dart';
import '../utils/shared_preferences_helper.dart';

class LoginController extends BaseController{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;

  final GlobalKey<FormState> loginForm = GlobalKey<FormState>();
  //RxBool emailFIllColor = true.obs;
  //RxBool passFIllColor = false.obs;
  RxBool hidePassword = true.obs;
  RxBool isRemember = false.obs;

  void login(String email, String password) async {
    try {
      loader.value = true;
      UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      debugPrint("user : $user");

      if (isRemember.value == true ) {
        sharedPreferencesHelper.storePrefData(email, emailController.text);
        sharedPreferencesHelper.storePrefData(password, passwordController.text);
        sharedPreferencesHelper.storeBoolPrefData('isLogin', true);
        //Get.offAndToNamed(HomeScreen.pageId);
      }else {
        sharedPreferencesHelper.storeBoolPrefData('isLogin', false);
      }
      Get.toNamed(CountryScreen.pageId);
    } on FirebaseAuthException catch (e) {

      Get.snackbar("Error", "$e", backgroundColor: ColorsConfig.colorLightRed,
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
        duration: const Duration(seconds: 2),);
    }
  }

  Future<void> signInWithGoogle()async {
    var googleAuth = await FlutterSocialMediaSignin().signInWithGoogle();
    await auth
        .signInWithCredential(googleAuth)
        .whenComplete(() =>
        sendDataFireStore(auth.currentUser!.email.toString(),)
    );
    debugPrint("auth : $auth");
    await Get.toNamed(CountryScreen.pageId);
  }

  sendDataFireStore(String email) async {
    FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    UserResponse userData = UserResponse();
    userData.email = email;
    userData.uid = user!.uid;
    userData.profile = ImagePath.profileIcon.toString();
    await firebaseFireStore
        .collection("users")
        .doc(user.uid)
        .set(userData.toMap());
  }

  void clearController() {
    emailController.clear();
    passwordController.clear();
  }
}