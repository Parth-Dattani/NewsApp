import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';
import 'package:news_app/screen/screen.dart';
import 'package:news_app/widgets/widgets.dart';
import '../../constant/constant.dart';

class CountryScreen extends GetView<CountryController> {
  static const pageId = "/CountryScreen";

  const CountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConfig.colorWhite,
      appBar: CommonAppBar(
        title: 'select_your_country'.tr,
        leadingIcon: ImagePath.arrowBack,
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 25, right: 25, top: 16, bottom: 25),
          child: Obx(
            () => Column(
              children: [
                CommonTextField(
                  controller: controller.searchController,
                  borderRadius: 6,
                  hintText: "Search",
                  hintTextStyle: CustomTextStyle.hintTextStyle,
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: ColorsConfig.colorGray,
                        size: 20,
                      )),
                  onChanged: (data) {
                    controller.searchCountry(data);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: controller.countryList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Obx(
                          () => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: controller.selectedIndex.value == index
                                    ? ColorsConfig.colorBlue
                                    : ColorsConfig.colorTransfer,
                              ),
                              child: ListTile(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  debugPrint(
                                      "Selected Country ser: ${controller.countryList[index].name}");
                                  controller.isSelected.value = true;
                                  controller.selectedIndex.value = index;
                                  controller.selectedCountry.value =
                                      controller.countryList[index].name!;
                                },
                                selected: controller.isSelected.value,
                                title: Text(
                                  controller.countryList[index].name.toString(),
                                  style: TextStyle(
                                    color:
                                        controller.selectedIndex.value == index
                                            ? ColorsConfig.colorWhite
                                            : ColorsConfig.colorBlack,
                                  ),
                                ),
                              )),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: const BoxDecoration(
          color: ColorsConfig.colorWhite,
          border: Border(
              top: BorderSide(color: ColorsConfig.colorLightGrey, width: 1)),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              blurRadius: 4,
              offset: Offset(0.0, -2),
            )
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: CommonButton(
          name: 'next'.tr,
          color: ColorsConfig.colorBlue,
          textStyle: CustomTextStyle.buttonStyle,
          borderRadius: 6,
          border: false,
          onPress: () {
            FocusScope.of(context).unfocus();
            controller.sendDataFirestore(controller.selectedCountry.value);
            Get.toNamed(TopicScreen.pageId);
          },
        ),
      ),
    );
  }
}
