import 'package:apple_invites/core/colors/colors.dart';
import 'package:apple_invites/core/common/app_list_tile.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

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
              AppListTile(
                title: "Notification",
                leadingIcon: Icons.notifications_none_outlined,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.notificationSetting);
                },
              ),

              AppListTile(
                title: "Privacy and Security",
                leadingIcon: Icons.security_outlined,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.privacySecurity);
                },
              ),
              AppListTile(
                title: "Account",
                leadingIcon: Icons.manage_accounts_outlined,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.manageAccount);
                },
              ),
              AppListTile(
                title: "Help",
                leadingIcon: Icons.help_center_outlined,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.helpPage);
                },
              ),
              AppListTile(
                title: "About",
                leadingIcon: Icons.account_box_outlined,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.aboutUsPage);
                },
              ),
              AppListTile(
                title: "Photo",
                leadingIcon: Icons.photo_album_outlined,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.photsPage);
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
            title: "SETTING",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
