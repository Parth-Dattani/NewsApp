import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constant/color_config.dart';
import 'package:news_app/constant/constant.dart';
import 'package:news_app/controller/controller.dart';
import 'package:news_app/screen/Login/login_screen.dart';

import '../../constant/image_path.dart';
import '../../widgets/widgets.dart';

class OnBoardScreen extends GetView<OnBoardController> {
  static const pageId = "/OnBoardScreen";
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  pageSnapping: true,
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller.pageController,
                  children: List.generate(
                    controller.images.length,
                    (index) => Column(
                      children: [
                        SizedBox(
                          width: Get.width,
                          height: Get.height/2,
                          child: Image.asset(controller.images[index],
                              fit: BoxFit.fill),
                        ),
                         Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 24.0, left: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text(
                                  'The world’s greatest newspaper.',
                                  style: CustomTextStyle.titleStyle,
                                ),
                                Text("If you come up with a memorable phrase name, be sure that it appeals to the complete audience.",
                                style: CustomTextStyle.subTitleStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPageChanged: (index) {
                    controller.currentPage.value = index;
                    //controller.images.value
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DotsIndicator(
                      dotsCount: controller.images.length,
                      position: controller.currentPage.toDouble(),
                      decorator: const DotsDecorator(
                          spacing: EdgeInsets.all(4),
                          size: Size.square(15),
                          activeSize: Size(15.0, 15.0),
                          activeColor: ColorsConfig.colorBlue),
                    ),

                    Row(
                      children: [
                        controller.currentPage.value != 0 ?
                        CommonButton(
                          name: 'back'.tr,
                          color: ColorsConfig.colorTransfer,
                          textStyle: CustomTextStyle.backButtonStyle,
                          borderRadius: 6,
                          border: false,
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                          onPress: (){
                            if (controller.currentPage.value != -1) {
                              controller.pageController.previousPage(duration: const Duration(milliseconds: 400), curve: Curves.ease);
                            }

                          },
                        ) : Container(),
                        CommonButton(
                          name: 'next'.tr,
                          color: ColorsConfig.colorBlue,
                          textStyle: CustomTextStyle.buttonStyle,
                          borderRadius: 6,
                          border: false,
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                          onPress: (){
                            if (controller.currentPage.value != 2) {
                              controller.pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.ease);
                            }
                            else if(controller.currentPage.value == 2){
                              print("els IF ${controller.currentPage}");
                              Get.toNamed(LoginScreen.pageId);
                            }

                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
