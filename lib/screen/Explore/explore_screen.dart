import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';
import '../../constant/constant.dart';

class ExploreScreen extends GetView<ExploreController>{
  static const pageId ="/ExploreScreen";

  const ExploreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 24, bottom: 15, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("explore".tr, style: CustomTextStyle.titleHeadStyle,),
              const SizedBox(height: 15,),
              Obx(
                ()=> ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.bookList.length,
                    itemBuilder: (context, index) {
                      return Row(children: [
                        Container(
                          height: Get.height*0.15,width: Get.width* 0.30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(ImagePath.appLogo, ),
                                fit: BoxFit.fitWidth,
                              )
                          ),
                          //child:
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.bookList[index].listName.toString(),
                                style: CustomTextStyle.newsHeadLineText,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                       controller.bookList[index].newestPublishedDate.toString(),
                                      style: CustomTextStyle.labelStyle,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                  const SizedBox(width: 15,),
                                  Expanded(
                                    child: Text(
                                      controller.bookList[index].updated.toString(),
                                      style: CustomTextStyle.labelStyle,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(height: 10.0);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
