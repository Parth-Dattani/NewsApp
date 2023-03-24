import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import '../../../constant/constant.dart';

class NewsListWidget extends StatelessWidget {

   final String title;
   final String section;
   final String byLine;
   final String publishedDate;
   final String newsLink;
   final String image;

  const NewsListWidget({Key? key,
    required this.title,
    required this.section,
    required this.byLine,
    required this.publishedDate,
    required this.newsLink,
    required this.image
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
      Image.network(image,height: 350, width: 150,),
      // Container(
      //   height: 100,
      //     width: 150,
      //     child: Image.network(image,fit: BoxFit.cover)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section,
            style: CustomTextStyle.timeStyle,
          ),
          Text(
            title,
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
                  Container(
                    width: Get.width*0.3,

                    child: Text(
                      byLine,
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
                    DateFormat('dd-MM-yyyy').format(DateTime.parse(publishedDate))
                    , style: CustomTextStyle.timeStyle,),
                ],
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
    );
  }
}
