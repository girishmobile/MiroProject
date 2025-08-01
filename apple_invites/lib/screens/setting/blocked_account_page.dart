import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/screens/models/contact_model.dart';
import 'package:apple_invites/screens/provider/block_account_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlockedAccountPage extends StatelessWidget {
  const BlockedAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyBlockList(context));
  }

  _buildFancyBlockList(BuildContext context) {
    final provider = Provider.of<BlockAccountProvider>(context);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child:
              provider.isEmptyList
                  ? loadEmptyView(
                    emptyIcon: Icons.block_outlined,
                    title: "No Blocked Accounts",
                    message:
                        "When you block a user, they'll show up here.Only you can see them.\nYou still have the option to unblock them if you would like.",
                    buttonTitle: "BLOCK AN ACCOUNT",
                    onPressed: () {
                      Navigator.pushNamed(context, RouteName.blockAccountList);
                    },
                  )
                  : ListView.builder(
                    itemCount: provider.listOfBlockAccount.length,
                    itemBuilder: (context, index) {
                      final friend = provider.listOfBlockAccount[index];
                      return loadGlassBackground(
                        child: _buildFancyListItem(
                          contact: friend,
                          onTaped: () {
                            provider.removeBlockUser(friend);
                          },
                        ),
                      );
                    },
                  ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: AppNavigationBar(
            title: "BLOCKED ACCOUNTS",
            onLeftTap: () {
              Navigator.pop(context);
            },
            isRightIcon: !provider.isEmptyList,
            rightIcons: Icons.person_add_alt_1_outlined,
            onRightTap: () {
              Navigator.pushNamed(context, RouteName.blockAccountList);
            },
          ),
        ),
      ],
    );
  }

  _buildFancyListItem({
    required ContactModel contact,
    required VoidCallback onTaped,
  }) {
    return Row(
      spacing: 8,
      children: [
        loadCircleImage(
          text: contact.name,
          icon: null,
          imageUrl: contact.imageUrl,
        ),
        Expanded(
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                contact.name,
                style: TextStyle(
                  fontFamily: fontRoboto,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.white,
                  letterSpacing: 1.1,
                ),
              ),
              Text(
                contact.phoneNumber,
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
        loadStaticGlassBtn(
          fontSize: 12,
          horizontalPadding: 12,
          verticalPadding: 8,
          text: "UNBLOCK",
          onPress: onTaped,
        ),
      ],
    );
  }
}
