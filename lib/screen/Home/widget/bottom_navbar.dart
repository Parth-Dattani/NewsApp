import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/constant.dart';

Widget bottomNavBar({ tabIndex,  changeTabIndex}) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: tabIndex,
    backgroundColor: ColorsConfig.colorWhite,
    selectedItemColor: ColorsConfig.colorBlue,
    unselectedItemColor: ColorsConfig.colorBlack,
    selectedFontSize: 14,
    unselectedFontSize: 14,
    elevation: 25,
    onTap:       changeTabIndex,
    // onTap: (value) {
    //   tabIndex = value;
    //   debugPrint("object : $tabIndex");
    // },
    items: [
      BottomNavigationBarItem(
        label: 'home'.tr,
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Image.asset(
            ImagePath.homeIcon,
            scale: 25,
            color: tabIndex == 0 ? ColorsConfig.colorBlue : ColorsConfig.colorGray,
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
            color: tabIndex == 1 ? ColorsConfig.colorBlue : ColorsConfig.colorGray,
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
            color: tabIndex == 2 ? ColorsConfig.colorBlue : ColorsConfig.colorGray,
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
            color: tabIndex == 3 ? ColorsConfig.colorBlue : ColorsConfig.colorGray,
          ),
        ),
      ),
    ],
  );
}
