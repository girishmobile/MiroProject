import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:flutter/material.dart';

class AppTextfieldWidget extends StatelessWidget {
  const AppTextfieldWidget({
    super.key,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.obscureText,
    this.enabled,
    this.readOnly,
  });
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? enabled;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        hintText: hintText ?? '',
        hintStyle: TextStyle(
          color: Colors.white.withValues(alpha: 0.5),
          fontFamily: fontRoboto,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.black.withValues(alpha: 0.7),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.7)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.5)),
        ),
      ),
      style: TextStyle(
        fontFamily: fontRoboto,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: Colors.white,
        letterSpacing: 1.2,
      ),
      textAlign: TextAlign.left,
    );
  }
}
