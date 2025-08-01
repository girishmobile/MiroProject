import 'package:apple_invites/core/colors/colors.dart';
import 'package:apple_invites/core/common/app_list_tile.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyHelp(context));
  }

  _buildFancyHelp(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: ListView(
            children: [
              AppListTile(
                title: "Report a Problem",
                leadingIcon: Icons.report_outlined,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.reportAProblem);
                },
              ),
              AppListTile(
                title: "Help Center",
                leadingIcon: Icons.help_center_outlined,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.myWebviewPage);
                },
              ),
              AppListTile(
                title: "Support Request",
                leadingIcon: Icons.support_outlined,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.supportRequestPage);
                },
              ),
              AppListTile(
                title: "Privacy & Security Help",
                leadingIcon: Icons.privacy_tip_outlined,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.privacySecurityHelp);
                },
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: AppNavigationBar(
            title: "HELP",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
