import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/screen/Home/widget/news_list_widget.dart';
import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';

class NewsScreen extends GetView<NewsController> {
  static const pageId = "/NewsScreen";

  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> CommonLoader( isLoad: controller.loader.value && controller.resultDataList.isEmpty,
      body: /*controller.resultDataList.isEmpty ? CircularProgressIndicator() :*/ Scaffold(
        backgroundColor: ColorsConfig.colorWhite,
        appBar: CommonAppBar(
          leadingIcon: ImagePath.appLogo,
          leadingOnTap: () {},
          leadingWidth: 150,
          iconSize: 4.5,
          actionIcon: [ImagePath.notificationIcon],
        ),
        body: SafeArea(
          child: Padding(
            padding:
            const EdgeInsets.only(left: 25, right: 25, top: 40, bottom: 16),
            child: Column(
              children: [
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
                  height: 15,
                ),
                DefaultTabController(
                  length: controller.tabList.length,
                  child: TabBar(
                      isScrollable: true,
                      labelPadding: const EdgeInsets.only(right: 10),
                      controller: controller.tabController,
                      labelColor: ColorsConfig.colorWhite,
                      indicatorWeight: 5,
                      indicatorSize: TabBarIndicatorSize.label,
                      unselectedLabelColor: ColorsConfig.colorBlack,
                      onTap: (e){
                        print("Taped Item Name :${controller.tabList[e]}");
                        controller.category = controller.tabList[e];
                        print("object cate : ${controller.category}");
                        controller.categoryNews(controller.category);
                      },
                      tabs: List.generate(
                          controller.tabList.length,
                              (index) => Tab(

                            child: Text(
                              controller.tabList[index],
                              style: CustomTextStyle.newsHeadLineText,
                            ),
                          ))

                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                  child:  TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: controller.tabController,
                        children:
                        List.generate(
                            controller.tabList.length,
                                (index) {
                              return Obx(
                                ()=> ListView.separated(
                                    itemCount: controller.resultDataList.length,
                                    itemBuilder: (context, index) {
                                      return NewsListWidget(
                                        section: controller.resultDataList[index].section.toString(),
                                        title: controller.resultDataList[index].title.toString(),
                                        byLine: controller.resultDataList[index].orgFacet!.isNotEmpty
                                            ? controller
                                            .resultDataList[index].orgFacet!.first
                                            .toString()
                                            : '',
                                        newsLink : controller.resultDataList[index].url.toString(),
                                        publishedDate:
                                        controller.resultDataList[index].publishedDate.toString(),
                                        image: controller.resultDataList[index].multimedia != null
                                            ? controller
                                            .resultDataList[index].multimedia![0].url
                                            .toString()
                                            : '',
                                      );
                                    },
                                    separatorBuilder: (BuildContext context, int index) {
                                      return Container(height: 35.0);
                                    }),
                              );

                            })
                      // const [
                      //   NewsListWidget(itemCount: 20),
                      //   Tab(text: "s"),
                      // ],
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}
