import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';
import 'package:news_app/screen/Congratulate/congratulate_screen.dart';
import 'package:news_app/screen/Home/home_screen.dart';
import '../../constant/constant.dart';
import '../../widgets/widgets.dart';

class TopicScreen extends GetView<TopicController> {
  static const pageId = "/TopicScreen";

  const TopicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConfig.colorWhite,
      appBar: CommonAppBar(
        title: 'Choose_your_topics'.tr,
        leadingIcon: ImagePath.arrowBack,
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 25, right: 25, top: 16, bottom: 25),
          child: Obx(
            ()=> Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                    controller.searchTopic(data);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                dynamicChips(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: Get.height * 0.11,
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
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
        child: CommonButton(
          name: 'next'.tr,
          color: ColorsConfig.colorBlue,
          textStyle: CustomTextStyle.buttonStyle,
          minWidth: 200,
          borderRadius: 6,
          border: false,
          onPress: () {
            FocusScope.of(context).unfocus();
            debugPrint("Topic Selected : ${controller.selectedTopic.value}");
              controller.sendDataFirestore(controller.selectedTopic.value);
            Get.toNamed(CongratulateScreen.pageId);
          },
        ),
      ),

    );
  }

  dynamicChips() {
    return Wrap(
      spacing: 5.0,
      runSpacing: 10.0,
      children: List<Widget>.generate(controller.topicList.length, (int index) {
        return Obx(
          ()=> ChoiceChip(
            label: Text(controller.topicList[index],
              style: TextStyle(color: controller.selectedIndex.value == index
                  ? ColorsConfig.colorWhite
                  : ColorsConfig.colorBlack,
              ),
            ),
            shadowColor: ColorsConfig.colorLightBlue,
            selected: controller.selectedIndex.value == index,
            selectedColor: ColorsConfig.colorBlue,
            backgroundColor:  ColorsConfig.colorWhite,
            onSelected: (bool selected) {
              controller.isSelected.value = true;
              controller.selectedIndex.value = (selected ? index : -1);
              controller.selectedTopic.value = controller.topicList[index];
              debugPrint("object : ${controller.selectedTopic.value }");
            },
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                    color: ColorsConfig.colorBlue,
                    width: 2.0)),

          ),
        );
      }),
    );
  }
}

