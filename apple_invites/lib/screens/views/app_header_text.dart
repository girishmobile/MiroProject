import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:flutter/material.dart';

class AppHeaderText extends StatelessWidget {
  const AppHeaderText({super.key, this.title, this.color, this.fontSize});

  final String? title;
  final Color? color;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? 'REDEFINE',
      style: TextStyle(
        color: color ?? Colors.white,
        fontFamily: fontRoboto,
        fontSize: fontSize ?? 18,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.1,
      ),
    );
  }
}
