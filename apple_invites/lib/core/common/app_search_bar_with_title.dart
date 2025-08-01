import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:flutter/material.dart';

class AppSearchBarWithTitle extends StatelessWidget {
  final String title;
  final String? hintText;
  final VoidCallback onBackPressed;
  final bool? readOnly;

  const AppSearchBarWithTitle({
    super.key,
    required this.title,
    this.hintText,
    required this.onBackPressed,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        AppNavigationBar(title: title, onLeftTap: onBackPressed),
        Container(
          height: 48,
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              Expanded(
                child: AppTextfield(
                  readOnly: readOnly,
                  hintText: hintText ?? "Search...",
                  onChanged: (val) {},
                  prefixIcon: Icons.search,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
