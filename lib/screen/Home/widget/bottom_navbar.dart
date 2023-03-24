import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/constant.dart';

Widget bottomNavBar({required int index}) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: index,
    backgroundColor: ColorsConfig.colorWhite,
    selectedItemColor: ColorsConfig.colorBlue,
    unselectedItemColor: ColorsConfig.colorBlack,
    selectedFontSize: 14,
    unselectedFontSize: 14,
    elevation: 25,
    onTap: (value) {
      index = value;
      debugPrint("object : $index");
    },
    items: [
      BottomNavigationBarItem(
        label: 'home'.tr,
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Image.asset(
            ImagePath.homeIcon,
            scale: 25,
            color: index == 0 ? ColorsConfig.colorBlue : ColorsConfig.colorGray,
          ),
        ),
      ),
      BottomNavigationBarItem(
        label: 'explore'.tr,
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Image.asset(
            ImagePath.exploreIcon,
            scale: 25,
            color: index == 1 ? ColorsConfig.colorBlue : ColorsConfig.colorGray,
          ),
        ),
      ),
      BottomNavigationBarItem(
        label: 'bookmark'.tr,
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Image.asset(
            ImagePath.bookMarkIcon,
            scale: 30,
            color: index == 2 ? ColorsConfig.colorBlue : ColorsConfig.colorGray,
          ),
        ),
      ),
      BottomNavigationBarItem(
        label: 'profile'.tr,
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Image.asset(
            ImagePath.profileIcon,
            scale: 25,
            color: index == 3 ? ColorsConfig.colorBlue : ColorsConfig.colorGray,
          ),
        ),
      ),
    ],
  );
}
