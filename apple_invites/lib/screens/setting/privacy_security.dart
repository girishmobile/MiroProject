import 'package:apple_invites/core/colors/colors.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/screens/provider/privacy_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrivacySecurity extends StatelessWidget {
  const PrivacySecurity({super.key});
  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyPrivacy(context));
  }

  _buildFancyPrivacy(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: CustomScrollView(
            slivers: [
              SliverList.list(
                children: [
                  _buildAccountPrivacy(context),
                  _buildLoginSecurity(context),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: AppNavigationBar(
            title: "PRIVACY & SECURITY",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  _buildAccountPrivacy(BuildContext context) {
    final provider = Provider.of<PrivacyProvider>(context);
    return loadGlassBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          loadTitleText(title: "Account Privacy"),
          SizedBox(height: 8),
          _buildRowItemWithSwitchBox(
            context: context,
            title: "Private Account",
            iconName: Icons.lock_outline,
            isValue: provider.hasPrivateAc,
            onChanged: (value) {
              provider.setIsPrivateAccount(value);
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: loadSubTitleText(
              fontColor: Colors.white.withValues(alpha: 0.7),
              fontSize: 12,
              title:
                  provider.hasPrivateAc
                      ? "Your account is PRIVATE"
                      : "Your account is PUBLIC",
            ),
          ),
          SizedBox(height: 8),
          loadDivider(),
          SizedBox(height: 8),
          loadTitleText(title: "Connections"),
          SizedBox(height: 8),
          _buildRowItem(
            title: "Block Account",
            iconName: Icons.block_outlined,
            onTap: () {
              Navigator.pushNamed(context, RouteName.blockedAccount);
            },
          ),
        ],
      ),
    );
  }

  _buildLoginSecurity(BuildContext context) {
    final provider = Provider.of<PrivacyProvider>(context);

    return loadGlassBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          loadTitleText(title: "Login Security"),
          SizedBox(height: 8),
          _buildRowItem(
            title: "Password",
            iconName: Icons.key_outlined,
            onTap: () {
              Navigator.pushNamed(context, RouteName.changePasswordPage);
            },
          ),
          SizedBox(height: 8),
          loadDivider(),
          SizedBox(height: 8),
          _buildRowItemWithSwitchBox(
            context: context,
            title: "Save Login Info",
            iconName: Icons.verified_user_outlined,
            isValue: provider.hasSaveInfo,
            onChanged: (value) {
              provider.setIsSaveInfo(value);
            },
          ),
          loadSubTitleText(
            fontColor: Colors.white.withValues(alpha: 0.7),
            fontSize: 12,
            title:
                provider.hasSaveInfo
                    ? "We'll remember the login for [username], so you won't need to enter it on your iCloud devices."
                    : "Your information not saved",
          ),
        ],
      ),
    );
  }

  _buildRowItemWithSwitchBox({
    required String title,
    required IconData iconName,
    required BuildContext context,
    required bool isValue,
    required void Function(bool) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Row(
        spacing: 8,
        children: [
          Icon(iconName, color: Colors.white, size: 28),
          Expanded(child: loadTitleText(title: title, fontSize: 14)),
          loadSwitchButton(
            context: context,
            isValue: isValue,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  _buildRowItem({
    required String title,
    required IconData iconName,
    required VoidCallback? onTap,
  }) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.white.withValues(alpha: 0.1),
        highlightColor: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Row(
            spacing: 8,
            children: [
              Icon(iconName, color: Colors.white, size: 28),
              Expanded(child: loadTitleText(title: title, fontSize: 14)),
              Icon(Icons.arrow_forward_ios, color: kBgCardColor, size: 16),
            ],
          ),
        ),
      ),
    );
  }
  //  final void Function(String)? onChanged;

  Widget loadSwitchButton({
    required BuildContext context,
    required bool isValue,
    required void Function(bool) onChanged,
  }) {
    return Theme(
      data: Theme.of(context).copyWith(
        switchTheme: SwitchThemeData(
          trackOutlineColor: WidgetStateProperty.all(
            Colors.white.withValues(alpha: 0.2),
          ),
        ),
      ),
      child: Switch(
        inactiveTrackColor: Colors.white.withValues(alpha: 0.2),
        inactiveThumbColor: Colors.grey.shade200,
        activeTrackColor: Colors.white.withAlpha(40),
        activeColor: Colors.white,
        value: isValue,
        onChanged: onChanged,
      ),
    );
  }
}
