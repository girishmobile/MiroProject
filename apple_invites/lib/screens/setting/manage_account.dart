import 'package:apple_invites/core/colors/colors.dart';
import 'package:apple_invites/core/common/app_list_tile.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/screens/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageAccount extends StatelessWidget {
  const ManageAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyPage(context));
  }

  _buildFancyPage(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: ListView(
            children: [
              _buildPersonalInfo(
                title: "PERSONAL INFORMATION",
                provider: provider,
              ),
              AppListTile(
                title: "EVENTS",
                leadingIcon: Icons.event_outlined,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.userEventPage);
                },
              ),

              _buildContactSyncing(
                title: "CONTACT SYNCING",
                provider: provider,
                context: context,
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: AppNavigationBar(
            title: "MANAGE ACCOUNT",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  _buildPersonalInfo({
    required String title,
    required ProfileProvider provider,
  }) {
    return loadGlassBackground(
      topPadding: 0,
      bottomPadding: 0,
      leftPadding: 0,
      rightPadding: 0,
      child: Column(
        children: [
          Material(
            borderRadius: BorderRadius.circular(8),
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white.withValues(alpha: 0.1),
              highlightColor: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                provider.setShowPersonalInfo(!provider.showPersonalInfo);
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  spacing: 8,
                  children: [
                    Icon(Icons.person_outline, color: Colors.white, size: 24),
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
                        ],
                      ),
                    ),

                    Icon(
                      Icons.arrow_forward_ios,
                      color: kBgCardColor,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (provider.showPersonalInfo) ...[
            Container(
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  loadSubTitleText(
                    fontColor: Colors.white.withValues(alpha: 0.7),
                    title:
                        "Provide your personal information, even if the account is used for a business or something else. This won't be part of your profile.",
                  ),
                  AppTextfield(hintText: "girish@gameplan.com", readOnly: true),
                  AppTextfield(hintText: "+91 9558697986"),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  _buildContactSyncing({
    required String title,
    required ProfileProvider provider,
    required BuildContext context,
  }) {
    return loadGlassBackground(
      topPadding: 0,
      bottomPadding: 0,
      leftPadding: 0,
      rightPadding: 0,
      child: Column(
        children: [
          Material(
            borderRadius: BorderRadius.circular(8),
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white.withValues(alpha: 0.1),
              highlightColor: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                provider.setShowContactSync(!provider.showContactSync);
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  spacing: 8,
                  children: [
                    Icon(
                      Icons.contact_page_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
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
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: kBgCardColor,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (provider.showContactSync) ...[
            Container(
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  _buildRowItemWithSwitchBox(
                    title: "Connect Contact",
                    context: context,
                  ),
                  loadSubTitleText(
                    fontColor: Colors.white.withValues(alpha: 0.7),
                    title:
                        "To help people connect on GamePlan, you can choose to have your contacts periodically synced and stored on our servers. You can pick which contacts to follow. Disconnect anytime to stop syncing. Learn More.",
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  _buildRowItemWithSwitchBox({
    required String title,
    required BuildContext context,
  }) {
    final provider = context.read<ProfileProvider>();
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),

      child: Row(
        spacing: 8,
        children: [
          Expanded(child: loadTitleText(title: title, fontSize: 14)),
          loadDynamicSwitchButton(
            context: context,
            value: provider.hasContactSync,
            onChanged: (val) {
              if (val == true) {}
              provider.setIsContactSyncing(val ?? false);
            },
          ),
        ],
      ),
    );
  }
}
