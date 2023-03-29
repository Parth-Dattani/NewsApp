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
          body: WillPopScope(
            onWillPop: ()async {
              return willPopCallback(context);
            },
            child: SafeArea(
              child: Obx(
                ()=> IndexedStack(
                  sizing: StackFit.expand,
                  index: controller.tabIndex.value,
                  children: [
                   controller.resultDataList.isNotEmpty ?
                   HomePageWidget(searchController: controller.searchController) : Container(),
                    const ExploreScreen(),
                    const BookMarkScreen(),
                    const ProfileScreen(),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar :
          Obx(()=> bottomNavBar(tabIndex: controller.tabIndex.value,changeTabIndex: controller.changeTabIndex))
        ),
      ),
    );
  }

  Future<bool> willPopCallback(context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CommonDialog(
            text: "Confirm to Quite App",
            onYesPress: () {
              SystemNavigator.pop();
            },
            onNoPress: () {
              Navigator.of(context).pop();
            },
          );
        });
    return false;
  }

}

