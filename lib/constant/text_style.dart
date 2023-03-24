import 'package:flutter/material.dart';

import 'constant.dart';

mixin AppTextStyle {

  static const poppinsRegular = 'Poppins Regular';
  static const poppinsBold = 'Poppins Bold';

  static const textFontSize7 = 7.0;
  static const textFontSize8 = 8.0;
  static const textFontSize10 = 10.0;
  static const textFontSize11 = 11.0;
  static const textFontSize12 = 12.0;
  static const textFontSize13 = 13.0;
  static const textFontSize14 = 14.0;
  static const textFontSize15 = 15.0;
  static const textFontSize16 = 16.0;
  static const textFontSize17 = 17.0;
  static const textFontSize18 = 18.0;
  static const textFontSize20 = 20.0;
  static const textFontSize22 = 22.0;
  static const textFontSize24 = 24.0;
  static const textFontSize28 = 28.0;
  static const textFontSize36 = 36.0;
  static const textFontSize32 = 32.0;
  static const textFontSize48 = 48.0;
  static const textFontSize72 = 72.0;
  static const textFontSize96 = 96.0;

  static const letterSpacing = 0.12;
  static const letterSpacing3 = -0.3;
}

class CustomTextStyle {

  static TextStyle titleStyle = const TextStyle(
    color: ColorsConfig.colorBlack,
    fontFamily: AppTextStyle.poppinsBold,
    fontSize: AppTextStyle.textFontSize24,
    fontWeight: FontWeight.w700,
    letterSpacing: AppTextStyle.letterSpacing
  );

  static TextStyle subTitleStyle = const TextStyle(
      color: ColorsConfig.colorGray,
      fontFamily: AppTextStyle.poppinsRegular,
      fontSize: AppTextStyle.textFontSize18,
      fontWeight: FontWeight.w400,
      letterSpacing: AppTextStyle.letterSpacing
  );

  static TextStyle buttonStyle = const TextStyle(
      color: ColorsConfig.colorWhite,
      fontFamily: AppTextStyle.poppinsRegular,
      fontSize: AppTextStyle.textFontSize16,
      fontWeight: FontWeight.w600,
      letterSpacing: AppTextStyle.letterSpacing
  );

  static TextStyle backButtonStyle = const TextStyle(
      color: ColorsConfig.colorDarkGray,
      fontFamily: AppTextStyle.poppinsRegular,
      fontSize: AppTextStyle.textFontSize16,
      fontWeight: FontWeight.w600,
      letterSpacing: AppTextStyle.letterSpacing
  );

  static TextStyle helloTextStyle = const TextStyle(
      color: ColorsConfig.colorBlack,
      fontFamily: AppTextStyle.poppinsBold,
      fontSize: AppTextStyle.textFontSize48,
      fontWeight: FontWeight.w700,
      letterSpacing: AppTextStyle.letterSpacing
  );

  static TextStyle againTextStyle = const TextStyle(
      color: ColorsConfig.colorBlue,
      fontFamily: AppTextStyle.poppinsBold,
      fontSize: AppTextStyle.textFontSize48,
      fontWeight: FontWeight.w700,
      letterSpacing: AppTextStyle.letterSpacing
  );


  static TextStyle loginSubTitleStyle = const TextStyle(
      color: ColorsConfig.colorGray,
      fontFamily: AppTextStyle.poppinsRegular,
      fontSize: AppTextStyle.textFontSize20,
      fontWeight: FontWeight.w400,
      letterSpacing: AppTextStyle.letterSpacing
  );

  static TextStyle forgotButton = const TextStyle(
    color: ColorsConfig.colorLightBlue,
    fontFamily: AppTextStyle.poppinsRegular,
    fontSize: AppTextStyle.textFontSize14,
    fontWeight: FontWeight.w400,
    letterSpacing: AppTextStyle.letterSpacing
    //height: 96
  );

  static TextStyle labelStyle = const TextStyle(
      color: ColorsConfig.colorGray,
      fontFamily: AppTextStyle.poppinsRegular,
      fontSize: AppTextStyle.textFontSize14,
      fontWeight: FontWeight.w400,
      letterSpacing: AppTextStyle.letterSpacing,
  );

  static TextStyle labelIconStyle = const TextStyle(
      color: ColorsConfig.colorRed,
      fontFamily: AppTextStyle.poppinsRegular,
      fontSize: AppTextStyle.textFontSize14,
      fontWeight: FontWeight.w400,
      letterSpacing: AppTextStyle.letterSpacing
  );

  static TextStyle googleButtonStyle = const TextStyle(
      color: ColorsConfig.colorMixGray,
      fontFamily: AppTextStyle.poppinsRegular,
      fontSize: AppTextStyle.textFontSize16,
      fontWeight: FontWeight.w600,
      letterSpacing: AppTextStyle.letterSpacing
  );

  static TextStyle signUpText = const TextStyle(
    color: ColorsConfig.colorBlue,
    fontFamily: AppTextStyle.poppinsRegular,
    fontSize: AppTextStyle.textFontSize14,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
    //height: 96
  );

  static TextStyle appBarText = const TextStyle(
    color: ColorsConfig.colorBlack,
    fontFamily: AppTextStyle.poppinsRegular,
    fontSize: AppTextStyle.textFontSize16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle hintTextStyle = const TextStyle(
    color: ColorsConfig.colorHintGrey,
    fontFamily: AppTextStyle.poppinsRegular,
    fontSize: AppTextStyle.textFontSize14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle chipsTextStyle = const TextStyle(
      color: ColorsConfig.colorBlue,
      fontFamily: AppTextStyle.poppinsRegular,
      fontSize: AppTextStyle.textFontSize16,
      fontWeight: FontWeight.w600,
      letterSpacing: AppTextStyle.letterSpacing
  );

  static TextStyle newsHeadLineText = const TextStyle(
    color: ColorsConfig.colorBlack,
    fontFamily: AppTextStyle.poppinsRegular,
    fontSize: AppTextStyle.textFontSize16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle newsStyle = const TextStyle(
    color: ColorsConfig.colorGray,
    fontFamily: AppTextStyle.poppinsRegular,
    fontSize: AppTextStyle.textFontSize13,
    fontWeight: FontWeight.w600,
    letterSpacing: AppTextStyle.letterSpacing,
  );

  static TextStyle timeStyle = const TextStyle(
    color: ColorsConfig.colorGray,
    fontFamily: AppTextStyle.poppinsRegular,
    fontSize: AppTextStyle.textFontSize13,
    fontWeight: FontWeight.w400,
    letterSpacing: AppTextStyle.letterSpacing,
  );

  static TextStyle congratulateTextStyle = const TextStyle(
    color: ColorsConfig.colorGray,
    fontFamily: AppTextStyle.poppinsRegular,
    fontSize: AppTextStyle.textFontSize32,
    fontWeight: FontWeight.w700,
    letterSpacing: AppTextStyle.letterSpacing3,
  );

  static TextStyle accountTextStyle = const TextStyle(
    color: ColorsConfig.colorGray,
    fontFamily: AppTextStyle.poppinsRegular,
    fontSize: AppTextStyle.textFontSize16,
    fontWeight: FontWeight.w400,
    letterSpacing: AppTextStyle.letterSpacing3,
  );

  static TextStyle headLineStyle = const TextStyle(
      color: ColorsConfig.colorBlack,
      fontFamily: AppTextStyle.poppinsBold,
      fontSize: AppTextStyle.textFontSize24,
      fontWeight: FontWeight.w400,
      letterSpacing: AppTextStyle.letterSpacing
  );
}
