import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';
import 'package:news_app/widgets/common_appbar.dart';

import '../../constant/constant.dart';

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
            SizedBox(height: 20,),
            Expanded(child: ListView.builder(
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
                   /* Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            section,
                            style: CustomTextStyle.timeStyle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Text(
                            title,
                            style: CustomTextStyle.newsHeadLineText,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
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
                                    CircleAvatar(minRadius: 12,
                                      backgroundImage: AssetImage(ImagePath.bbcNewsIcon,),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Text(
                                        byLine,
                                        style: CustomTextStyle.timeStyle,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(Icons.access_time_rounded),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      DateFormat('dd-MM-yyyy').format(DateTime.parse(publishedDate))
                                      , style: CustomTextStyle.timeStyle,),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.more_horiz, color: ColorsConfig.colorGray,),
                                onPressed: (){
                                  debugPrint("Share Link : $newsLink");
                                  Share.share(newsLink, subject: "Today's News");
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),*/
                  ]);
                },)
            )

          ],
        ),
      ),
    );
  }

}