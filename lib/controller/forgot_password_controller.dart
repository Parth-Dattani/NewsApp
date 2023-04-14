import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/base_controller.dart';

class ForgotPasswordController extends BaseController{
  RxString selectedValue = "Via Email:".obs;
  dynamic groupValue;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  RxBool isForgot = false.obs;
  RxBool isPhone = false.obs;
  RxString email = "".obs;

  RxList<String>  title = <String>[
    "Via Email:",
    "Via SMS:"
  ].obs;

  RxList<String>  subTitle = <String>[
    "dattani@gmail.com  ",
    "+91 9512359782 :"
  ].obs;
}