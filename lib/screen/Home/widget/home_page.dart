import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/screen/News/news_screen.dart';
import '../../../constant/constant.dart';
import '../../../controller/home_controller.dart';
import '../../../widgets/widgets.dart';
import 'widget.dart';

class HomePageWidget extends StatelessWidget {
  final TextEditingController searchController;

  static final controller = Get.find<HomeController>();

  HomePageWidget({Key? key, required this.searchController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 40, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextField(
            controller: searchController,
            borderRadius: 6,
            hintText: "Search",
            hintTextStyle: CustomTextStyle.hintTextStyle,
            prefixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: ColorsConfig.colorGray,
                  size: 20,
                )),
            suffixIcon: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  ImagePath.filterIcon,
                  color: ColorsConfig.colorGray,
                )),
            onChanged: (data) {
              //controller.searchTopic(data);
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "trending".tr,
                style: CustomTextStyle.appBarText,
              ),
              Text(
                "see_all".tr,
                style: CustomTextStyle.labelStyle,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: ColorsConfig.colorLightGray),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                  blurRadius: 4,
                  offset: Offset(0.0, -2),
                )
              ],
            ),
            child: Image.asset(ImagePath.appLogo),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "europe".tr,
            style: CustomTextStyle.timeStyle,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Russian warship: Moskva sinks in Black Sea".tr,
            style: CustomTextStyle.newsHeadLineText,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Image.asset(ImagePath.bbcNewsIcon),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "bbc_news".tr,
                    style: CustomTextStyle.timeStyle,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Icon(Icons.access_time_rounded),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text("4h ago"),
                ],
              ),
              const Icon(
                Icons.more_horiz,
                color: ColorsConfig.colorGray,
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "latest".tr,
                style: CustomTextStyle.appBarText,
              ),
              TextButton(
                child: Text(
                  "see_all".tr,
                  style: CustomTextStyle.labelStyle,
                ),
                onPressed: () {
                  Get.toNamed(NewsScreen.pageId);
                },
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Obx(
            () => Expanded(
                child: controller.resultDataList.isNotEmpty
                    ?
                      ListView.separated(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return NewsListWidget(
                            section: controller.resultDataList[index].section
                                .toString(),
                            title: controller.resultDataList[index].title
                                .toString(),
                            byLine: controller.resultDataList[index].orgFacet!.isNotEmpty
                                ? controller
                                        .resultDataList[index].orgFacet!.first
                                        .toString()
                                : '',
                            publishedDate: controller
                                .resultDataList[index].publishedDate
                                .toString(),
                            newsLink:
                                controller.resultDataList[index].url.toString(),
                            image: controller.resultDataList[index].multimedia!.isNotEmpty
                                ? controller
                                .resultDataList[index].multimedia![0].url.toString()
                                : '',
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Container(height: 35.0);
                        })
                    : const Center(child: CircularProgressIndicator())),
          )
        ],
      ),
    );
  }
}

// @override
// Widget homePage({required TextEditingController searchController}) {
//
// }
