import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_app/controller/controller.dart';
import 'package:news_app/model/model.dart';
import '../../constant/constant.dart';
import '../../utils/shared_preferences_helper.dart';
import '../../widgets/widgets.dart';

class DetailScreen extends GetView<DetailController> {
  static const pageId = "/DetailScreen";

  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: ColorsConfig.colorWhite,
        appBar: CommonAppBar(
          leadingIcon: ImagePath.arrowBack,
          actionIcon: [Icons.share, 12],
          actionIconSize: 2,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        minRadius: 25,
                        backgroundImage: AssetImage(
                          ImagePath.bbcNewsIcon,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: controller.byLine.value.isEmpty ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Get.width*0.45,
                            child: Text(
                              controller.byLine.value,
                              style: CustomTextStyle.appBarText,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Text(
                            DateFormat('dd-MM-yyyy').format(
                                DateTime.parse(controller.publishedDate.value)),
                            style: CustomTextStyle.hintTextStyle,
                          ),
                        ],
                      ),
                      const Spacer(),
                      CommonButton(
                        name: 'following'.tr,
                        color: ColorsConfig.colorBlue,
                        textStyle: CustomTextStyle.buttonStyle,
                        borderRadius: 6,
                        minWidth: 70,
                        border: false,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        onPress: () {
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  SizedBox(
                    height: Get.height*0.40,width: Get.width * 0.90,
                    child: CachedNetworkImage(
                      imageUrl:  controller.image.value,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,),
                        ),
                      ),
                      placeholder: (context, url) => Transform.scale(
                        scale: 0.5,
                        child: const CircularProgressIndicator(
                          backgroundColor: ColorsConfig.colorRed,
                          strokeWidth: 3,
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red,),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    controller.section.value,
                    style: CustomTextStyle.hintTextStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    controller.title.value,
                    style: CustomTextStyle.headLineStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    controller.abstract.value,
                    style: CustomTextStyle.newsHeadLineText,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: Get.height * 0.1,
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
          child: Row(
            children: [
              const Icon(Icons.favorite, color: ColorsConfig.colorPink),
              const SizedBox(
                width: 5,
              ),
              Text(
                "24.k",
                style: CustomTextStyle.newsHeadLineText,
              ),
              const SizedBox(
                width: 30,
              ),
              Image.asset(
                ImagePath.commentIcon,
                scale: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "1K",
                style: CustomTextStyle.newsHeadLineText,
              ),
              const Spacer(),
              Obx(
                () => IconButton(
                    onPressed: () async {
                      debugPrint("isBookMark : ${controller.isBookMark.value}");
                      controller.isBookMark.value = !controller.isBookMark.value;
                      debugPrint("isBookMark : ${controller.isBookMark.value}");
                      // sharedPreferencesHelper.storePrefData("bookmark_news" , controller.title.value);


                    controller.retriveData();

                      controller.bookMarkdList.add(Results(
                        section: controller.section.value,
                        title: controller.title.value,
                        byline: controller.byLine.value,
                        publishedDate: controller.publishedDate.value,
                        url: controller.image.value,
                        abstract: controller.abstract.value,
                      ));

                      sharedPreferencesHelper.storePrefData('bookmark_news', jsonEncode(controller.bookMarkdList));
                      //sharedPreferencesHelper.storePrefDataListResult('bookmark_news', controller.bookMarkdList.value);
                      // sharedPreferencesHelper.storePrefDataList('Answers', [jsonEncode(controller.data())]);
                    },
                    icon: controller.isBookMark.value
                        ? const Icon(
                            Icons.bookmark,
                            color: ColorsConfig.colorBlue,
                          )
                        : const Icon(Icons.bookmark_border_rounded)),
              ),
              //Icon(Icons.bookmark, color: ColorsConfig.colorBlue,)
            ],
          ),
        ),
      ),
    );
  }
}
