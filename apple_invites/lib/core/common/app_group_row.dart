import 'package:apple_invites/core/colors/colors.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/screens/models/group_model.dart';
import 'package:flutter/material.dart';

class AppGroupRow extends StatelessWidget {
  final GroupModel group;
  final VoidCallback onPressed;

  const AppGroupRow({super.key, required this.group, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final bool hasSubtitle = group.subTitle?.trim().isNotEmpty ?? false;

    return loadGlassBackground(
      leftPadding: 0,
      rightPadding: 0,
      bottomPadding: 0,
      topPadding: 0,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          splashColor: Colors.white.withValues(alpha: 0.1),
          highlightColor: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              spacing: 8,
              children: [
                loadCircleImage(imageUrl: group.imageUrl, text: group.name),
                Expanded(
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        group.name,
                        style: TextStyle(
                          fontFamily: fontRoboto,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.white,
                          letterSpacing: 1.1,
                        ),
                      ),
                      if (hasSubtitle) ...[
                        loadSubTitleText(
                          title: group.subTitle,
                          fontColor: Colors.white.withValues(alpha: 0.7),
                        ),
                      ],
                    ],
                  ),
                ),

                Icon(Icons.arrow_forward_ios, color: kBgCardColor, size: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/**
 * Row(
      spacing: 8,
      children: [
        loadCircleImage(text: group.name, icon: null, imageUrl: group.imageUrl),
        Expanded(
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                group.name,
                style: TextStyle(
                  fontFamily: fontRoboto,
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                  color: Colors.white,
                  letterSpacing: 1.1,
                ),
              ),
              (group.subTitle != null && group.subTitle!.trim().isNotEmpty)
                  ? Text(
                    group.subTitle ?? "",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: fontRoboto,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.white.withValues(alpha: 0.8),
                      letterSpacing: 1.1,
                    ),
                  )
                  : SizedBox.shrink(),
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
 */