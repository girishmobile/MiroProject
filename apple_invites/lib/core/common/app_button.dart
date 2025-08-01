import 'package:apple_invites/core/common/app_text_widget.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.text, required this.onPressed});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white.withValues(alpha: 0.7),
        elevation: 0,
      ),
      child: AppTextWidget(text: text),
    );
  }
}

/**
This widget is a custom button that uses the ElevatedButton widget from Flutter
 */
