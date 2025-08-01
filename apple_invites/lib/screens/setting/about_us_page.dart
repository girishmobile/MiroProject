import 'package:apple_invites/core/colors/colors.dart';
import 'package:apple_invites/core/common/app_list_tile.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_text_widget.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyAbout(context));
  }

  _buildFancyAbout(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: ListView(
            children: [
              AppListTile(
                title: "Data Policy",
                leadingIcon: Icons.policy_outlined,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.myWebviewPage);
                },
              ),

              AppListTile(
                title: "Terms of Use",
                leadingIcon: Icons.dashboard_customize_outlined,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.myWebviewPage);
                },
              ),
              AppListTile(
                title: "Open Source Libraries",
                leadingIcon: Icons.source_outlined,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.myWebviewPage);
                },
              ),
            ],
          ),
        ),
        Positioned(
          child: AppNavigationBar(
            title: "ABOUT US",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
