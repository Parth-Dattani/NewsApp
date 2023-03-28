import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';
import '../../constant/constant.dart';
import '../../widgets/widgets.dart';

class ExploreScreen extends GetView<ExploreController>{
  static const pageId ="/ExploreScreen";

  const ExploreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 24, bottom: 15, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("explore".tr, style: CustomTextStyle.titleHeadStyle,),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "topic".tr,
                  style: CustomTextStyle.appBarText,
                ),
                Text(
                  "see_all".tr,
                  style: CustomTextStyle.labelStyle,
                )
              ],
            ),
            const SizedBox(height: 20,),
            Expanded(child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
                itemBuilder: (context, index) {
                  return Row(children: [
                    Container(
                      height: Get.height*0.15,width: Get.width* 0.30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(ImagePath.appLogo, ),
                              fit: BoxFit.fill,
                          )
                      ),
                      //child:
                    ),
                    const SizedBox(width: 5,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "section",
                            style: CustomTextStyle.newsHeadLineText,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text(
                            "titledfdfgdfbv dfgvdfg dfgdr",
                            style: CustomTextStyle.labelStyle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          const SizedBox(
                            height: 5,
                          ),

                        ],
                      ),
                    ),
                    const SizedBox(width: 5,),
                    CommonButton(
                      name: 'save'.tr,
                      color: ColorsConfig.colorTransfer,
                      textStyle: CustomTextStyle.chipsTextStyle,
                      minWidth: 80,
                      //padding: EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                      borderRadius: 6,
                      border: true,
                      borderColor: ColorsConfig.colorBlue,
                      onPress: () {
                        FocusScope.of(context).unfocus();
                      },
                    ),

                  ]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(height: 30.0);
                }),
            ),

            Text(
              "popular_topic".tr,
              style: CustomTextStyle.appBarText,
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
                          ImagePath.exploreIcon
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
                          // controller.resultDataList[0].orgFacet!.isNotEmpty
                          //     ? controller.resultDataList[0].orgFacet!.first.toString()
                          //     :
                               'dsf',
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
                        "sdfsdf"
                        // DateFormat('dd-MM-yyyy').format(DateTime.parse(controller.resultDataList[0].publishedDate.toString()))
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
                    //Get.toNamed(NewsScreen.pageId);
                  },
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

}