import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';
import 'package:news_app/screen/Home/widget/widget.dart';
import 'package:share_plus/share_plus.dart';

import '../../constant/constant.dart';
import '../../widgets/widgets.dart';
import '../screen.dart';

class BookMarkScreen extends GetView<BookMarkController> {
  static const pageId = '/BookMarkScreen';

  const BookMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Padding(
          padding:
              const EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 16),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("bookmark".tr, style:  Theme.of(context).textTheme.displayLarge!.copyWith(
                fontFamily: AppTextStyle.poppinsBold,
                fontSize: AppTextStyle.textFontSize32,
                fontWeight: FontWeight.w700,
                letterSpacing: AppTextStyle.letterSpacing,
              )),
              const SizedBox(height: 15,),
              CommonTextField(
                controller: controller.searchController,
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
              // Obx(
              //   () => controller.resultDataList.isNotEmpty
              //       ?
              Expanded(
                child: Obx(
                  () => ListView.separated(
                      shrinkWrap: true,
                      itemCount: controller.bookMarkdList.length,
                      //physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            print("dfkdshf : ${controller.bookMarkdList[index].url.toString()}");
                            print("bookMArk Image URl : ${
                            controller.bookMarkdList[index].multimedia != null ?
                            controller.bookMarkdList[index].multimedia![0].url
                                .toString() : ''}");
                            Get.toNamed(DetailScreen.pageId,
                                arguments: {
                                  'section': controller.bookMarkdList[index].section.toString(),
                                  'title': controller.bookMarkdList[index].title.toString(),
                                  'byLine' : controller.bookMarkdList[index].orgFacet != null
                                      ? controller.bookMarkdList[index].orgFacet!.first.toString()
                                      : '',
                                  'publishedDate': controller.bookMarkdList[index].publishedDate.toString(),
                                  'image' :controller.bookMarkdList[index].multimedia != null ?
                                  controller.bookMarkdList[index].multimedia![0].url
                                      .toString() : '',
                                  'abstract' :controller.bookMarkdList[index].abstract.toString()
                                });

                          },
                          child: Obx(
                              ()=> NewsListWidget(
                              section: controller.bookMarkdList[index].section
                                  .toString(),
                              title:
                                  controller.bookMarkdList[index].title.toString(),
                              byLine: controller.bookMarkdList[index].orgFacet !=
                                      null
                                  ? controller.bookMarkdList[index].orgFacet!.first
                                      .toString()
                                  : '',
                              publishedDate: controller
                                  .bookMarkdList[index].publishedDate
                                  .toString(),
                              newsLink:
                                  controller.bookMarkdList[index].url.toString(),
                              image:
                                  controller.bookMarkdList[index].url != null
                                      ? controller.bookMarkdList[index].url.toString()
                                      : '',
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Container(height: 35.0);
                      }),
                ),
              )
              //       : const Center(child: CircularProgressIndicator()),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
