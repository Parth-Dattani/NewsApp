import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constant/constant.dart';
import 'package:news_app/controller/controller.dart';
import 'package:news_app/screen/screen.dart';
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
          appBar: CommonAppBar(
            leadingIcon: ImagePath.appLogo,
            leadingWidth: 150,
            iconSize: 4.5,
            actionIcon: [ImagePath.notificationIcon],
          ),
          body: Obx(
            ()=> IndexedStack(
              sizing: StackFit.expand,
              index: controller.currentIndex.value,
              children: [
               controller.resultDataList.isNotEmpty ?
               HomePageWidget(searchController: controller.searchController) : Container(),
                const ExploreScreen(),
                Container(child: Text("${controller.currentIndex.value+1}"),),
                Container(child: Text("${controller.currentIndex.value+1}"),) ,
              ],
            ),
          ),
          bottomNavigationBar : Obx(()=> bottomNavBar(index: controller.currentIndex.value)),
        ),
      ),
    );
  }
}