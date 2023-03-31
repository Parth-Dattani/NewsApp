import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';
import '../../constant/constant.dart';
import '../../widgets/widgets.dart';
import '../Home/widget/widget.dart';
import '../screen.dart';

class ProfileScreen extends GetView<ProfileController> {
  static const pageId = "/ProfileScreen";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      //drawerEnableOpenDragGesture: false,
      appBar: CommonAppBar(
        title: 'profile'.tr,
        actionIcon: ImagePath.settingIcon,
        actionOnTap: () {
          debugPrint("TAp");
          Scaffold.of(context).openDrawer();
          controller.scaffoldKey.currentState!.isDrawerOpen;
          controller.scaffoldKey.currentState!.openEndDrawer();
        },
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 15, left: 24, bottom: 15, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    minRadius: 40,
                    backgroundImage: AssetImage(
                      ImagePath.bbcNewsIcon,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text("2150", style: CustomTextStyle.appBarText),
                      Text("followers".tr,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontFamily: AppTextStyle.poppinsRegular,
                        fontSize: AppTextStyle.textFontSize16,
                        fontWeight: FontWeight.w400,
                        letterSpacing: AppTextStyle.letterSpacing3,
                      ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text("50", style: CustomTextStyle.appBarText),
                      Text("following".tr,
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontFamily: AppTextStyle.poppinsRegular,
                          fontSize: AppTextStyle.textFontSize16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: AppTextStyle.letterSpacing3,
                        ),)
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text("2150",
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontFamily: AppTextStyle.poppinsRegular,
                          fontSize: AppTextStyle.textFontSize16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "news".tr,
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontFamily: AppTextStyle.poppinsRegular,
                          fontSize: AppTextStyle.textFontSize16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: AppTextStyle.letterSpacing3,
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "parth Dattani",
                  style:  Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontFamily: AppTextStyle.poppinsRegular,
                    fontSize: AppTextStyle.textFontSize16,
                    fontWeight: FontWeight.w600,
                  )
              ),
              Text(
                "parth Dattani sdfijf csdkfnv kjdhjscns skfldjaf cfjdsfb",
                  style:  Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontFamily: AppTextStyle.poppinsRegular,
                    fontSize: AppTextStyle.textFontSize16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: AppTextStyle.letterSpacing3,
                  )
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonButton(
                    name: 'edit_profile'.tr,
                    color: ColorsConfig.colorBlue,
                    textStyle: CustomTextStyle.buttonStyle,
                    borderRadius: 6,
                    minWidth: 70,
                    border: false,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    onPress: () {
                      // FocusScope.of(context).unfocus();
                       Get.toNamed(EditProfileScreen.pageId,
                         arguments: {
                           'editProfile': controller.isEdit.value = true,
                         }
                       );

                    },
                  ),
                  CommonButton(
                    name: 'website'.tr,
                    color: ColorsConfig.colorBlue,
                    textStyle: CustomTextStyle.buttonStyle,
                    borderRadius: 6,
                    //minWidth: 80,
                    border: false,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    onPress: () {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "news".tr,
                  style:  Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontFamily: AppTextStyle.poppinsRegular,
                    fontSize: AppTextStyle.textFontSize16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: AppTextStyle.letterSpacing3,
                  )
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Obx(
                  ()=> ListView.separated(
                      shrinkWrap: true,
                      itemCount: controller.resultDataList.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            debugPrint(
                                "dfkdshf : ${controller.resultDataList[index].section.toString()}");
                            Get.toNamed(DetailScreen.pageId, arguments: {
                              'section': controller.resultDataList[index].section
                                  .toString(),
                              'title': controller.resultDataList[index].title
                                  .toString(),
                              'byLine': controller
                                      .resultDataList[index].orgFacet!.isNotEmpty
                                  ? controller
                                      .resultDataList[index].orgFacet!.first
                                      .toString()
                                  : '',
                              'publishedDate': controller
                                  .resultDataList[index].publishedDate
                                  .toString(),
                              //'image' :controller.resultDataList[index].multimedia![0].url.toString(),
                              'image':
                                  controller.resultDataList[index].multimedia !=
                                          null
                                      ? controller.resultDataList[index]
                                          .multimedia![0].url
                                          .toString()
                                      : '',
                              'abstract': controller
                                  .resultDataList[index].abstract
                                  .toString()
                            });
                          },
                          child: NewsListWidget(
                            section: controller.resultDataList[index].section
                                .toString(),
                            title:
                                controller.resultDataList[index].title.toString(),
                            byLine: controller
                                    .resultDataList[index].orgFacet!.isNotEmpty
                                ? controller.resultDataList[index].orgFacet!.first
                                    .toString()
                                : '',
                            publishedDate: controller
                                .resultDataList[index].publishedDate
                                .toString(),
                            newsLink:
                                controller.resultDataList[index].url.toString(),
                            image: controller
                                    .resultDataList[index].multimedia!.isNotEmpty
                                ? controller
                                    .resultDataList[index].multimedia![0].url
                                    .toString()
                                : '',
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Container(height: 25.0);
                      }),
                ),
              )

/*               Obx(
                 ()=> Switch(
                    value: controller.isLightTheme.value,
                    onChanged: (val) {
                      controller.isLightTheme.value = val;
                      Get.changeThemeMode(
                        controller.isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
                      );
                      controller.saveThemeStatus();
                    },
                  ),
               ),*/
            ],
          ),
        ),
      ),
      endDrawer: Column(
          children: [
            CommonAppBar(
              leadingIcon: ImagePath.arrowBack,
            title: "settings".tr,
            ),
             Expanded(child: drawer())
          ],),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ColorsConfig.colorBlue,
        elevation: 0,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget drawer() {
    return Obx(
      () => Drawer(

        width: Get.width,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Column(
              children: List.generate(
                controller.drawerItems.length,
                    (index) => ListTile(
                      selected: controller.drawerItems[index].selected ?? false,
                      selectedColor: ColorsConfig.colorBlue,
                      leading: Icon(
                        controller.drawerItems[index].icon ??
                            (Icons.ssid_chart),
                        // color: ColorsConfig.colorBlack,
                        size: 30,
                      ),
                      title: Text(
                        controller.drawerItems[index].title ?? '',
                        style: CustomTextStyle.appBarText,
                      ),
                      trailing:
                      controller.drawerItems[index].action ?? null ,
                      onTap: () {
                        controller.drawerOnTap(index);
                        debugPrint("send  $index");
                      },
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
