import 'package:apple_invites/core/colors/colors.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:flutter/material.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.onTap,
    this.subtitle = '',
    this.trailingIcon = Icons.arrow_forward,

    //  this.radius = 24,
    // this.iconSize = 24,
    // this.fontSize = 16,
  });

  final String title;
  final String subtitle;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final VoidCallback onTap;

  // final double radius;
  // final double iconSize;
  // final double fontSize;

  @override
  Widget build(BuildContext context) {
    final bool hasSubtitle = subtitle.trim().isNotEmpty;

    return loadGlassBackground(
      topPadding: 0,
      bottomPadding: 0,
      leftPadding: 0,
      rightPadding: 0,
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white.withValues(alpha: 0.1),
          highlightColor: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Row(
              spacing: 8,
              children: [
                Icon(leadingIcon, color: Colors.white, size: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      loadTitleText(
                        fontWight: FontWeight.w700,
                        fontSize: 14,
                        title: title,
                      ),
                      if (hasSubtitle) ...[
                        SizedBox(height: 4),
                        loadSubTitleText(
                          fontSize: 12,
                          title: subtitle,
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
