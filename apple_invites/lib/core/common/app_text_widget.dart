import 'package:apple_invites/core/colors/colors.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:flutter/material.dart';

class AppTextWidget extends StatelessWidget {
  const AppTextWidget({
    super.key,
    this.color,
    required this.text,
    this.alignment,
    this.fontSize,
    this.fontWeight,
    this.textStyle,
  });

  final String text;
  final Color? color;
  final TextAlign? alignment;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          textStyle ??
          TextStyle(
            color: color ?? kSecondaryColor,
            fontFamily: fontRoboto,
            fontSize: fontSize,
            fontWeight: fontWeight ?? FontWeight.w500,
            letterSpacing: 1.02,
          ),
      textAlign: alignment,
    );
  }
}

/**
 */
