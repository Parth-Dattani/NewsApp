import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constant/constant.dart';
import 'package:news_app/controller/controller.dart';
import '../../widgets/widgets.dart';
import 'widget/widget.dart';

class HomeScreen extends GetView<HomeController>{
  static const pageId = "/HomeScreen";

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> CommonLoader(
        isLoad: controller.loader.value && controller.resultDataList.isNotEmpty,
        body: Scaffold(
          backgroundColor: ColorsConfig.colorWhite,
          appBar: CommonAppBar(
            leadingIcon: ImagePath.appLogo,
            leadingWidth: 150,
            iconSize: 4.5,
            actionIcon: ImagePath.notificationIcon,
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: [
             HomePageWidget(searchController: controller.searchController),
              Container(child: Text("${controller.currentIndex.value}"),),
              Container(child: Text("${controller.currentIndex.value}"),),
              Container(child: Text("${controller.currentIndex.value}"),),
            ],
          ),
          bottomNavigationBar : bottomNavBar(index: controller.currentIndex.value),
        ),
      ),
    );
  }
}