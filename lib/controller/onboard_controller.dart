import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/base_controller.dart';

class OnBoardController extends BaseController{

  final pageController = PageController(
    initialPage: 0,
  );

  RxInt currentPage = 0.obs;
  RxList<String> images = [
    'assets/images/splash_1.png',
    'assets/images/splash_2.png',
    'assets/images/splash_3.png',
  ].obs;
}