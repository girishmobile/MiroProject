import 'package:apple_invites/core/colors/colors.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:flutter/material.dart';

class SupportRequestPage extends StatelessWidget {
  const SupportRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyList(context));
  }

  _buildFancyList(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: ListView(
            children: [
              _buildListItem(
                title: "Reports",
                subTitle:
                    "These are reports you've submitted (includes reports on users and technological issues).",
                iconName: Icons.report_outlined,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.reportRequest);
                },
              ),
              _buildListItem(
                title: "Customer Support",
                subTitle: "These are support requests that you've submitted.",
                iconName: Icons.report_outlined,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.customerSupport);
                },
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          right: 0,
          child: AppNavigationBar(
            title: "REQUESTS",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  _buildListItem({
    required String title,
    required String subTitle,
    required IconData iconName,
    required VoidCallback? onTap,
  }) {
    final bool hasSubtitle = subTitle.trim().isNotEmpty;

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
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Row(
              spacing: 8,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4,
                    children: [
                      loadTitleText(
                        fontWight: FontWeight.w700,
                        fontSize: 16,
                        title: title,
                      ),
                      if (hasSubtitle) ...[
                        loadSubTitleText(
                          title: subTitle,
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
