import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/constant.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String? leadingIcon;
  final double? iconSize;
  final double? actionIconSize;
  final double? actionIconSize2;
  final double? leadingWidth;
  final String? title;
  final String? titleIcon;
  final VoidCallback? leadingOnTap;
  final String Function(String)? onChange;
  //final List? actionIcon;
  //final List? actionIcon2;
  final VoidCallback? actionOnTap;
  final VoidCallback? actionOnTap2;
  final String? actionIcon;
  final String? actionIcon2;
  final bool? secondVisible;

  const CommonAppBar({
    Key? key,
    this.leadingIcon,
    this.secondVisible = false,
    this.iconSize,
    this.actionIconSize,
    this.actionIconSize2,
    this.title,
    this.titleIcon,
    this.leadingOnTap,
    this.onChange,
    this.actionIcon,
    this.actionIcon2,
    this.actionOnTap,
    this.actionOnTap2,
    this.leadingWidth
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      //backgroundColor: ColorsConfig.colorWhite,
      elevation: 0,

      title: Text(title ?? '', style: Theme.of(context).textTheme.displayLarge!.copyWith(
        fontFamily: AppTextStyle.poppinsRegular,
        fontSize: AppTextStyle.textFontSize16,
        fontWeight: FontWeight.w600,
      )),
      leading: GestureDetector(
        onTap: leadingOnTap ?? (){
          Get.back();
        },
        child: leadingIcon != null
            ? Image.asset(
          leadingIcon!,
          color: Theme.of(context).brightness == Brightness.light ? ColorsConfig.colorGray : ColorsConfig.colorDarkGray,
          scale: iconSize ??  25.0,
        )
            : Container(),
      ),
      leadingWidth: leadingWidth,

      actions: [
        Row(
          children: [
            GestureDetector(
              onTap: actionOnTap ?? (){
                //Get.back();
              },
              child: actionIcon != null ?
              Image.asset(actionIcon!, scale: actionIconSize ??  25.0,
                color: Theme.of(context).brightness == Brightness.light ? ColorsConfig.colorGray : ColorsConfig.colorDarkGray,
              ) : Container()

            ) ,
           SizedBox(width: actionIcon2 != null ?  20 :0,),
            Visibility(
              visible:  secondVisible ! ,
                child: GestureDetector(
                    onTap: actionOnTap2 ?? (){
                      //Get.back();
                    },
                    child: actionIcon2 != null ? Container(
                        child: Image.asset(actionIcon2!,
                          color: Theme.of(context).brightness == Brightness.light ? ColorsConfig.colorGray : ColorsConfig.colorDarkGray,
                          scale: actionIconSize2 ??  25.0,)): Container()
    ))],
        ),
        const SizedBox(width: 10,),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
