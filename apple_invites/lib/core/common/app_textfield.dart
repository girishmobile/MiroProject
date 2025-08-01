import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget {
  const AppTextfield({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly,
    this.bgColor,
    this.onChanged,
    this.hintStyle,
    this.borderColor,
    this.textController,
    this.initialValue,
    this.onTaped,
  });

  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? readOnly;
  final Color? bgColor;
  final Color? borderColor;
  final TextStyle? hintStyle;
  final void Function(String)? onChanged;
  final TextEditingController? textController;
  final String? initialValue;
  final VoidCallback? onTaped;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      decoration: BoxDecoration(
        color: bgColor ?? Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor ?? Colors.white.withAlpha(30)),
        gradient: appGradient,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          prefixIcon != null
              ? Icon(
                prefixIcon,
                size: 20,
                color: Colors.white.withValues(alpha: 0.7),
              )
              : const SizedBox.shrink(),
          Expanded(
            child: TextField(
              controller: textController,
              onChanged: onChanged,
              onTap: onTaped,
              style: TextStyle(
                color: Colors.white,
                fontFamily: fontRoboto,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                hintText: hintText ?? "",
                hintStyle:
                    hintStyle ??
                    TextStyle(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: fontRoboto,
                    ),
                border: InputBorder.none,
              ),
              readOnly: readOnly ?? false,
            ),
          ),
          suffixIcon != null
              ? InkWell(
                child: Icon(
                  suffixIcon,
                  size: 20,
                  color: Colors.white.withValues(alpha: 0.7),
                ),
              )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
