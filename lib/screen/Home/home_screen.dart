import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:news_app/constant/constant.dart';
import 'package:news_app/controller/controller.dart';
import 'package:news_app/screen/screen.dart';
import 'package:news_app/utils/common.dart';
import '../../widgets/widgets.dart';
import 'widget/widget.dart';

class HomeScreen extends GetView<HomeController>{
  static const pageId = "/HomeScreen";

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> CommonLoader(
        isLoad: controller.loader.value,
        body: Scaffold(
          backgroundColor: ColorsConfig.colorWhite,
          body: SafeArea(
            child: Obx(
              ()=> IndexedStack(
                sizing: StackFit.expand,
                index: controller.tabIndex.value,
                children: [
                 controller.resultDataList.isNotEmpty ?
                 HomePageWidget(searchController: controller.searchController) : Container(),
                  const ExploreScreen(),
                  const BookMarkScreen(),
                  Container(child: Text("${controller.tabIndex.value+1}"),) ,
                ],
              ),
            ),
          ),
          bottomNavigationBar :
          Obx(()=> bottomNavBar(tabIndex: controller.tabIndex.value,changeTabIndex: controller.changeTabIndex))
        ),
      ),
    );
  }


}

