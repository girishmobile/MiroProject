import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/screens/models/display_model.dart';
import 'package:flutter/material.dart';

class AppListRow extends StatelessWidget {
  final DisplayModel data;
  final bool? isCheckBox;

  const AppListRow({super.key, required this.data, this.isCheckBox});
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        loadCircleImage(text: data.name, icon: null, imageUrl: data.imageUrl),
        Expanded(
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                data.name,
                style: TextStyle(
                  fontFamily: fontRoboto,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.white,
                  letterSpacing: 1.1,
                ),
              ),
              Text(
                data.subtitle,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: fontRoboto,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.white.withValues(alpha: 0.8),
                  letterSpacing: 1.1,
                ),
              ),
            ],
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: Colors.white.withAlpha(80),
          size: 16,
        ),
      ],
    );
  }
}
