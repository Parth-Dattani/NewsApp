import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';
import 'package:news_app/screen/Home/widget/widget.dart';
import 'package:news_app/widgets/common_appbar.dart';
import 'package:share_plus/share_plus.dart';

import '../../constant/constant.dart';
import '../../widgets/widgets.dart';

class BookMarkScreen extends GetView<BookMarkController>{
  static const pageId = '/BookMarkScreen';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 40, bottom: 16),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            height: Get.height*0.4,
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
                image: DecorationImage(
                    image: AssetImage(
                        ImagePath.appLogo
                    ),
                    fit: BoxFit.fill
                )
            ),

          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "controller.resultDataList[0].section.toString()",
            style: CustomTextStyle.timeStyle,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "controller.resultDataList[0].title.toString()",
            style: CustomTextStyle.newsHeadLineText,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    CircleAvatar(minRadius: 15,
                      backgroundImage: AssetImage(ImagePath.bbcNewsIcon,),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        "controller.resultDataList[0].orgFacet!.isNotEmpty"
                        //    ? controller.resultDataList[0].orgFacet!.first.toString()
                          //  : ''
                        ,
                        style: CustomTextStyle.timeStyle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Icon(Icons.access_time_rounded),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "DateFormat('dd-MM-yyyy').format(DateTime.parse(controller.resultDataList[0].publishedDate.toString()))"
                      , style: CustomTextStyle.timeStyle,),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.more_horiz, color: ColorsConfig.colorGray,),
                onPressed: (){
                  //debugPrint("Share Link : ${controller.resultDataList[0].url.toString()}");
                  //Share.share(controller.resultDataList[0].url.toString(), subject: "Today's News");
                },
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          const SizedBox(
            height: 25,
          ),
          // Obx(
          //   () => controller.resultDataList.isNotEmpty
          //       ?
          ListView.separated(
              shrinkWrap: true,
              itemCount: 10,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    //debugPrint("dfkdshf : ${controller.resultDataList[index].section.toString()}");
                    // Get.toNamed(DetailScreen.pageId,
                    //     arguments: {
                    //       'section': controller.resultDataList[index].section.toString(),
                    //       'title': controller.resultDataList[index].title.toString(),
                    //       'byLine' : controller.resultDataList[index].orgFacet!.isNotEmpty
                    //           ? controller.resultDataList[index].orgFacet!.first.toString()
                    //           : '',
                    //       'publishedDate': controller.resultDataList[index].publishedDate.toString(),
                    //       'image' :controller.resultDataList[index].multimedia![0].url.toString(),
                    //       'abstract' :controller.resultDataList[index].abstract.toString()
                    //     });
                  },
                  child: const NewsListWidget(
                    section: "controller.resultDataList[index].section.toString()",
                    title: "controller.resultDataList[index].title.toString()",
                    byLine:
                    "controller.resultDataList[index].orgFacet!.isNotEmpty"
                        // ? controller.resultDataList[index].orgFacet!.first.toString()
                        // : ''
                    ,
                    publishedDate: "controller.resultDataList[index].publishedDate.toString()",
                    newsLink:
                    "controller.resultDataList[index].url.toString()",
                     image:
                  "controller.resultDataList[index].multimedia!.isNotEmpty"
                    //     ? controller
                    //     .resultDataList[index].multimedia![0].url.toString()
                    //     : ''
                    ,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(height: 35.0);
              })
          //       : const Center(child: CircularProgressIndicator()),
          // )
        ],
      ),
    );
  }

}