import 'package:apple_invites/core/colors/colors.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:flutter/material.dart';

class AppCheckbox extends StatefulWidget {
  const AppCheckbox({super.key, this.onChanged, this.onTap, this.title});

  final String? title;
  final void Function()? onTap;
  final void Function()? onChanged;

  @override
  State<AppCheckbox> createState() => _AppCheckboxState();
}

class _AppCheckboxState extends State<AppCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: Colors.white.withValues(alpha: 0.5),
      checkColor: Colors.white,
      title: GestureDetector(
        onTap: widget.onTap,
        child: RichText(
          text: TextSpan(
            text: "I agree to the ",
            style: TextStyle(
              fontSize: 14,
              fontFamily: fontRoboto,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.1,
              color: Colors.white.withValues(alpha: 0.7),
            ),
            children: [
              TextSpan(
                text: widget.title ?? "Terms and Conditions",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: fontRoboto,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.02,
                  color: Colors.white.withValues(alpha: 0.9),
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  decorationThickness: 1.0,
                ),
              ),
            ],
          ),
        ),
      ),
      value: isChecked,
      side: BorderSide(color: Colors.white.withValues(alpha: 0.7), width: 2),
      onChanged: (bool? value) {
        setState(() {
          isChecked = value ?? false;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
