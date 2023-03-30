import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';
import 'package:news_app/screen/BookDetail/book_detail_screen.dart';
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
              //Text("explore".tr, style: CustomTextStyle.titleHeadStyle,),
              Text("explore".tr, style:  Theme.of(context).textTheme.displayLarge!.copyWith(
                fontFamily: AppTextStyle.poppinsBold,
                fontSize: AppTextStyle.textFontSize32,
                fontWeight: FontWeight.w700,
                letterSpacing: AppTextStyle.letterSpacing,
              )),
              const SizedBox(height: 15,),
              Obx(
                ()=> ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.bookList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          debugPrint("Book List NAme :${controller.bookList[index].listName}");
                          Get.toNamed(BookDetailScreen.pageId,
                          arguments: {
                            'listName' : controller.bookList[index].listName,
                            'date' : controller.bookList[index].oldestPublishedDate,
                          });

                        },
                        child: Row(children: [
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
                                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontFamily: AppTextStyle.poppinsRegular,
                                    fontSize: AppTextStyle.textFontSize16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                         controller.bookList[index].newestPublishedDate.toString(),
                                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                          fontFamily: AppTextStyle.poppinsRegular,
                                          fontSize: AppTextStyle.textFontSize14,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: AppTextStyle.letterSpacing,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                    const SizedBox(width: 15,),
                                    Expanded(
                                      child: Text(
                                        controller.bookList[index].updated.toString(),
                                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                          fontFamily: AppTextStyle.poppinsRegular,
                                          fontSize: AppTextStyle.textFontSize14,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: AppTextStyle.letterSpacing,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                      );
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
