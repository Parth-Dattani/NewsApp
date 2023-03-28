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
        style: CustomTextStyle.titleStyle,
      ),
      content: Text(
        '$text?',
        style: CustomTextStyle.subTitleStyle,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: onYesPress,
          child: Text(
            '$yesText',
            style: CustomTextStyle.subTitleStyle,
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
