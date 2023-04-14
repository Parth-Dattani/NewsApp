import 'package:flutter/material.dart';
import '../constant/constant.dart';

class CustomRadioButton extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final ValueChanged? onChange;
  final int? id;
  final dynamic groupValue;
  final value;
  final Color? selectedColor;

  const CustomRadioButton({Key? key, this.title,  this.id, this.groupValue, this.value, this.onChange, this.selectedColor, this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: ColorsConfig.colorLightGrey
        ),
        color: ColorsConfig.colorLightGrey
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
        child: RadioListTile(
          controlAffinity: ListTileControlAffinity.trailing,
          secondary: Container(
            height: 60,width: 60,
            decoration:  BoxDecoration(
              color: ColorsConfig.colorBlue,
              borderRadius: BorderRadius.circular(6),
              image: const DecorationImage(
                scale:25,
                image: AssetImage(
                  "assets/images/smsIcon.png",
                ),
              ),
            ),
          ),

          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title.toString(),   style: CustomTextStyle.radioTitleStyle,),
  //            Text(subTitle.toString(),   style: CustomTextStyle.newsHeadLineText,),
            ],
          ),
          groupValue: groupValue,
          value: value,
          onChanged: onChange,
          tileColor: ColorsConfig.colorWhite,
          selectedTileColor: ColorsConfig.colorBlue,
          activeColor: Colors.blue,
        ),
      ),
    );
  }
}
