import 'package:flutter/material.dart';
import 'package:news_app/constant/color_config.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final bool isObscure;
  final bool? fillColors;
  final TextStyle? hintTextStyle;
  final double? borderRadius;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final bool? filled;
  final ValueChanged<String>? onChanged;

  const CommonTextField({
    Key? key,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIcon,
    this.hintText,
    this.isObscure = false,
    this.validator,
    this.hintTextStyle,
    this.borderRadius,
    required this.controller,
    this.filled = true,
    this.fillColors,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      textDirection: TextDirection.ltr,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        hintText: hintText,
        suffixIcon: suffixIcon,

        filled: filled,
        //fillColor: Theme.of(context).brightness == Brightness.dark ? ColorsConfig.colorLightGrey : ColorsConfig.colorTransfer,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: ColorsConfig.colorBlack,
            width: 1.0,
          ),
        ),),
      validator: validator,
      obscureText: isObscure,
      onChanged: onChanged,

    );
  }
}
