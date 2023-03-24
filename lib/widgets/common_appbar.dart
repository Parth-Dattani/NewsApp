import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/constant.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String? leadingIcon;
  final double? iconSize;
  final double? leadingWidth;
  final String? title;
  final String? titleIcon;
  final VoidCallback? leadingOnTap;
  final String Function(String)? onChange;
  final String? actionIcon;
  final VoidCallback? actionOnTap;

  const CommonAppBar({
    Key? key,
    this.leadingIcon,
    this.iconSize,
    this.title,
    this.titleIcon,
    this.leadingOnTap,
    this.onChange,
    this.actionIcon,
    this.actionOnTap,
    this.leadingWidth
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: ColorsConfig.colorWhite,
      elevation: 0,

      title: Text(title ?? '', style: CustomTextStyle.appBarText),
      leading: GestureDetector(
        onTap: leadingOnTap ?? (){
          Get.back();
        },
        child: leadingIcon != null
            ? Image.asset(
          leadingIcon!,
          scale: iconSize ??  25.0,
        )
            : Container(),
      ),
      leadingWidth: leadingWidth,
      actions: [
        GestureDetector(
          onTap: actionOnTap ?? (){
            //Get.back();
          },
          child: actionIcon != null
              ?
       Image.asset(ImagePath.notificationIcon, scale: iconSize ??  25.0,) :Container(),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
