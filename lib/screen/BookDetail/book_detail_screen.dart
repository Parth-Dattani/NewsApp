import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';
import 'package:news_app/widgets/common_loader.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constant/constant.dart';
import '../screen.dart';

class BookDetailScreen extends GetView<BookDetailController>{
  static const pageId ="/BookDetailScreen";

  const BookDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> CommonLoader(
        isLoad: controller.loader.value,

        body: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 25, left: 24, bottom: 15, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("books".tr, style: CustomTextStyle.titleHeadStyle,),
                    const SizedBox(height: 15,),
                    Obx(
                      ()=> GridView.builder(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.bookDetailsList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () async {
                                  launchUrlStart(url: controller.bookDetailsList[index].amazonProductUrl.toString(),);
                                  // Get.toNamed(DetailScreen.pageId,
                                  //     arguments: {
                                  //       'section': controller
                                  //           .bookDetailsList[index].title
                                  //           .toString(),
                                  //       'title': controller.bookDetailsList[index]
                                  //           .title.toString(),
                                  //       'byLine': controller
                                  //           .bookDetailsList[index].description !=
                                  //           null
                                  //           ? controller.bookDetailsList[index]
                                  //           .author!.toString()
                                  //           : '',
                                  //       'publishedDate': controller
                                  //           .bookDetailsList[index].price
                                  //           .toString(),
                                  //       'image': controller.bookDetailsList[index]
                                  //           .bookImage != null ?
                                  //       controller.bookDetailsList[index]
                                  //           .bookImage
                                  //           .toString() : '',
                                  //       'abstract': controller
                                  //           .bookDetailsList[index].author
                                  //           .toString()
                                  //     });
                                },
                                child: Column(children: [
                                  SizedBox(
                                    height: Get.height*0.25,width: Get.width* 0.40,
                                    child:
                                    CachedNetworkImage(
                                      imageUrl: controller.bookDetailsList[index].bookImage.toString(),
                                      imageBuilder: (context, imageProvider) => Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: ColorsConfig.colorBlack,
                                          width: 1),
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
                                  Container(
                                    //height: Get.height*0.19,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.bookDetailsList[index].title.toString(),
                                          style: CustomTextStyle.appBarText,
                                          overflow: TextOverflow.visible,
                                          maxLines: 1,
                                        ),
                                        Text(
                                           controller.bookDetailsList[index].description.toString(),
                                          style: CustomTextStyle.labelStyle,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                        dataList("Author", controller.bookDetailsList[index].author.toString()),
                                        dataList("Price", controller.bookDetailsList[index].price.toString()),
                                        // Expanded(
                                        //   child: Row(
                                        //     children: [
                                        //       Text("Author : ", style: CustomTextStyle.appBarText,),
                                        //       Expanded(
                                        //         child: Text(
                                        //           controller.bookDetailsList[index].author.toString(),
                                        //           style: CustomTextStyle.labelStyle,
                                        //           overflow: TextOverflow.clip,
                                        //           maxLines: 1,                                        ),
                                        //       ),
                                        //      ],
                                        //    ),
                                        //  ),
                                        // Expanded(
                                        //   child: Row(
                                        //     children: [
                                        //       Text("Price : ", style: CustomTextStyle.appBarText,),
                                        //       Expanded(
                                        //         child: Text(
                                        //           controller.bookDetailsList[index].price.toString(),
                                        //           style: CustomTextStyle.labelStyle,
                                        //           overflow: TextOverflow.clip,
                                        //           maxLines: 1,                                        ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ]),
                              );
                            },
                        gridDelegate:
                         SliverGridDelegateWithFixedCrossAxisCount(

                            crossAxisCount: 2,
                           crossAxisSpacing: 20,
                            mainAxisSpacing: 5,
                           childAspectRatio: (Get.width / Get.height * 0.8)

                           ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> launchUrlStart({required String url}) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  Widget dataList(title, subTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 60,
          child: Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: Text(title,
                textAlign: TextAlign.left,
                style: CustomTextStyle.appBarText),
          ),
        ),
        Expanded(
          child: Text(
            subTitle,
            textAlign: TextAlign.left,
            overflow: TextOverflow.clip,
            maxLines: 1,
            style: CustomTextStyle.labelStyle,
          ),
        ),
      ],
    );
  }
}

