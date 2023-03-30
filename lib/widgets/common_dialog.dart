import 'package:flutter/material.dart';
import '../constant/constant.dart';

class CommonDialog extends StatelessWidget {
  final String? text;
  final String? yesText;
  final String? noText;
  final VoidCallback? onYesPress;
  final VoidCallback? onNoPress;

  const CommonDialog({Key? key, this.text, this.onYesPress, this.onNoPress,
    this.yesText = 'yes', this.noText = 'no'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Are you sure?',
          style:  Theme.of(context).textTheme.displayLarge!.copyWith(
              fontFamily: AppTextStyle.poppinsBold,
              fontSize: AppTextStyle.textFontSize24,
              fontWeight: FontWeight.w700,
              letterSpacing: AppTextStyle.letterSpacing
          )
      ),
      content: Text(
        '$text?',
        style:  Theme.of(context).textTheme.displayMedium!.copyWith(
            fontFamily: AppTextStyle.poppinsRegular,
            fontSize: AppTextStyle.textFontSize18,
            fontWeight: FontWeight.w400,
            letterSpacing: AppTextStyle.letterSpacing
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: onYesPress,
          child: Text(
            '$yesText',
            style:  Theme.of(context).textTheme.displayMedium!.copyWith(
                fontFamily: AppTextStyle.poppinsRegular,
                fontSize: AppTextStyle.textFontSize18,
                fontWeight: FontWeight.w400,
                letterSpacing: AppTextStyle.letterSpacing
            ),
          ),
        ),
        TextButton(
          onPressed: onNoPress,
          child: Text(
            '$noText',
            style: CustomTextStyle.signUpText,
          ),
        ),
      ],
    );
  }
}
