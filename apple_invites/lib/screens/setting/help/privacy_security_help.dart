import 'package:apple_invites/core/colors/colors.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:flutter/material.dart';

class PrivacySecurityHelp extends StatelessWidget {
  const PrivacySecurityHelp({super.key});

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
              _buildManageAccount(context),
              _buildCustomizeExperience(context),
              _buildReportingContent(context),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: AppNavigationBar(
            title: "PRIVACY & SECURITY HELP",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  _buildManageAccount(BuildContext context) {
    return loadGlassBackground(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          loadRowWithIcon(
            title: "Managing Your Account",
            iconName: Icons.manage_accounts_outlined,
          ),
          _buildRowItem(
            title: "Age Requirements",
            onTap: () {
              Navigator.pushNamed(context, RouteName.myWebviewPage);
            },
          ),
          _buildRowItem(
            title: "Account Privacy",
            onTap: () {
              Navigator.pushNamed(context, RouteName.myWebviewPage);
            },
          ),
          _buildRowItem(
            title: "Location Sharing",
            onTap: () {
              Navigator.pushNamed(context, RouteName.myWebviewPage);
            },
          ),
        ],
      ),
    );
  }

  _buildCustomizeExperience(BuildContext context) {
    return loadGlassBackground(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          loadRowWithIcon(
            title: "Customizing Your Experience",
            iconName: Icons.dashboard_customize_outlined,
          ),
          _buildRowItem(
            title: "Blocking Accounts",
            onTap: () {
              Navigator.pushNamed(context, RouteName.myWebviewPage);
            },
          ),
          _buildRowItem(
            title: "Removing Friends",
            onTap: () {
              Navigator.pushNamed(context, RouteName.myWebviewPage);
            },
          ),
          _buildRowItem(
            title: "Removing Friends",
            onTap: () {
              Navigator.pushNamed(context, RouteName.myWebviewPage);
            },
          ),
          _buildRowItem(
            title: "Choosing Who Can Reply to Your Event",
            onTap: () {
              Navigator.pushNamed(context, RouteName.myWebviewPage);
            },
          ),
        ],
      ),
    );
  }

  _buildReportingContent(BuildContext context) {
    return loadGlassBackground(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          loadRowWithIcon(
            title: "Reporting Content You Don't Like",
            iconName: Icons.dashboard_customize_outlined,
          ),
          _buildRowItem(
            title: "Reporting Accounts or Events",
            onTap: () {
              Navigator.pushNamed(context, RouteName.myWebviewPage);
            },
          ),
          _buildRowItem(
            title: "Reporting Intimate Images",
            onTap: () {
              Navigator.pushNamed(context, RouteName.myWebviewPage);
            },
          ),
        ],
      ),
    );
  }

  _buildRowItem({required String title, required VoidCallback? onTap}) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.white.withValues(alpha: 0.1),
        highlightColor: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 8, 4, 8),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Row(
            spacing: 8,
            children: [
              Expanded(child: loadSubTitleText(title: title, fontSize: 14)),
              Icon(Icons.arrow_forward_ios, color: kBgCardColor, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
