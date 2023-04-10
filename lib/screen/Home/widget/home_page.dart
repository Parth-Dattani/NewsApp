import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:intl/intl.dart';
import 'package:news_app/screen/Detail/detail_screen.dart';
import 'package:news_app/screen/News/news_screen.dart';
import 'package:share_plus/share_plus.dart';
import '../../../constant/constant.dart';
import '../../../controller/home_controller.dart';
import '../../../widgets/widgets.dart';
import 'widget.dart';

class HomePageWidget extends StatelessWidget {
  final TextEditingController searchController;

  static final controller = Get.find<HomeController>();

  const HomePageWidget({Key? key, required this.searchController}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    final debouncer = Debouncer(delay:Duration(milliseconds: 500));
    return Scaffold(
      appBar: CommonAppBar(
        leadingIcon: ImagePath.appLogo,
        leadingWidth: 150,
        iconSize: 4.5,
        actionIconSize: 25,
        actionIcon: ImagePath.notiIcon,
        actionOnTap: (){
          print("action tap 1");
        },
      ),
      body:  Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 40, bottom: 16),
        child: Obx(
          ()=> ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextField(
                controller: searchController,
                borderRadius: 6,
                hintText: "Search",
              //  hintTextStyle: CustomTextStyle.hintTextStyle,
                prefixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,

                      size: 20,
                    )),
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      ImagePath.filterIcon,
                    )),
                onChanged: (data) {
                  //debouncer.run(() =>
                  //controller.searchController.text.isEmpty ? controller.resultDataList :
                  controller.filterNews(data);

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
                      style:  Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontFamily: AppTextStyle.poppinsRegular,
                        fontSize: AppTextStyle.textFontSize14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: AppTextStyle.letterSpacing,
                      )
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: Get.height*0.40,
                child:
                CachedNetworkImage(
                  imageUrl:  controller.resultDataList[0].multimedia![0].url.toString(),
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
                height: 15,
              ),
              Text(
                controller.resultDataList[0].section.toString(),
                 style:  Theme.of(context).textTheme.displaySmall!.copyWith(
                fontFamily: AppTextStyle.poppinsRegular,
                fontSize: AppTextStyle.textFontSize13,
                fontWeight: FontWeight.w400,
                letterSpacing: AppTextStyle.letterSpacing,
              )
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                controller.resultDataList[0].title.toString(),
                  style:  Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontFamily: AppTextStyle.poppinsRegular,
                    fontSize: AppTextStyle.textFontSize16,
                    fontWeight: FontWeight.w400,
                  )
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
                            controller.resultDataList[0].orgFacet!.isNotEmpty
                                ? controller.resultDataList[0].orgFacet!.first.toString()
                                : '',
                            style:  Theme.of(context).textTheme.displaySmall!.copyWith(
                              fontFamily: AppTextStyle.poppinsRegular,
                              fontSize: AppTextStyle.textFontSize13,
                              fontWeight: FontWeight.w400,
                              letterSpacing: AppTextStyle.letterSpacing,
                            ),
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
                          DateFormat('dd-MM-yyyy').format(DateTime.parse(controller.resultDataList[0].publishedDate.toString()))
                          ,
                          style:  Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontFamily: AppTextStyle.poppinsRegular,
                            fontSize: AppTextStyle.textFontSize13,
                            fontWeight: FontWeight.w400,
                            letterSpacing: AppTextStyle.letterSpacing,
                          ),)
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_horiz,),
                    onPressed: (){
                      debugPrint("Share Link : ${controller.resultDataList[0].url.toString()}");
                      Share.share(controller.resultDataList[0].url.toString(), subject: "Today's News");
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 15,
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
                        style:  Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontFamily: AppTextStyle.poppinsRegular,
                          fontSize: AppTextStyle.textFontSize14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: AppTextStyle.letterSpacing,
                        )
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
              // Obx(
              //   () => controller.resultDataList.isNotEmpty
              //       ?
              controller.searchList.isEmpty ?
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount:
                        controller.resultDataList.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              debugPrint("dfkdshf : ${controller.resultDataList[index].section.toString()}");
                              Get.toNamed(DetailScreen.pageId,
                              arguments: {
                                'section': controller.resultDataList[index].section.toString(),
                                'title': controller.resultDataList[index].title.toString(),
                                'byLine' : controller.resultDataList[index].orgFacet!.isNotEmpty
                                    ? controller.resultDataList[index].orgFacet!.first.toString() : '',
                                'publishedDate': controller.resultDataList[index].publishedDate.toString(),
                                //'image' :controller.resultDataList[index].multimedia![0].url.toString(),
                                'image' :controller.resultDataList[index].multimedia!.isNotEmpty?
                                controller.resultDataList[index].multimedia![0].url.toString() : '',
                                'abstract' :controller.resultDataList[index].abstract.toString()
                              });
                            },
                            child:
                            NewsListWidget(
                              section: controller.resultDataList[index].section.toString(),
                              title: controller.resultDataList[index].title.toString(),
                              byLine: controller.resultDataList[index].orgFacet!.isNotEmpty
                                  ? controller.resultDataList[index].orgFacet!.first.toString()
                                  : '',
                              publishedDate: controller.resultDataList[index].publishedDate.toString(),
                              newsLink:
                                  controller.resultDataList[index].url.toString(),
                              image: controller.resultDataList[index].multimedia != null
                                  ? controller.resultDataList[index].multimedia![0].url.toString() : '',
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Container(height: 35.0);
                        })
:
              ListView.separated(
                  shrinkWrap: true,
                  itemCount:
                  controller.searchList.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        debugPrint("dfkdshf : ${controller.searchList[index].section.toString()}");
                        Get.toNamed(DetailScreen.pageId,
                            arguments: {
                              'section': controller.searchList[index].section.toString(),
                              'title': controller.searchList[index].title.toString(),
                              'byLine' : controller.searchList[index].orgFacet!.isNotEmpty
                                  ? controller.searchList[index].orgFacet!.first.toString() : '',
                              'publishedDate': controller.searchList[index].publishedDate.toString(),
                              //'image' :controller.resultDataList[index].multimedia![0].url.toString(),
                              'image' :controller.searchList[index].multimedia!.isNotEmpty?
                              controller.searchList[index].multimedia![0].url.toString() : '',
                              'abstract' :controller.searchList[index].abstract.toString()
                            });
                      },
                      child:

                      NewsListWidget(
                        section: controller.searchList[index].section.toString(),
                        title: controller.searchList[index].title.toString(),
                        byLine: controller.searchList[index].orgFacet!.isNotEmpty
                            ? controller.searchList[index].orgFacet!.first.toString()
                            : '',
                        publishedDate: controller.searchList[index].publishedDate.toString(),
                        newsLink:
                        controller.searchList[index].url.toString(),
                        image: controller.searchList[index].multimedia != null
                            ? controller.searchList[index].multimedia![0].url.toString() : '',
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
        ),
      ),
    );
  }
}
