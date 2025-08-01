import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/screens/models/contact_model.dart';
import 'package:apple_invites/screens/provider/block_account_provider.dart';
import 'package:apple_invites/screens/provider/friend_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlockAccountList extends StatelessWidget {
  const BlockAccountList({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyAccountList(context));
  }

  _buildFancyAccountList(BuildContext context) {
    final provider = context.read<FriendProvider>();
    final blockProvider = context.read<BlockAccountProvider>();
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 104),
          child: ListView.builder(
            itemCount: provider.listOfContacts.length,
            itemBuilder: (context, index) {
              final friend = provider.listOfContacts[index];
              return loadGlassBackground(
                child: _buildFancyListItem(
                  contact: friend,
                  onTaped: () {
                    blockProvider.addBlockUser(friend);
                    Navigator.pop(context);
                  },
                ),
              );
            },
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          right: 0,
          child: _buildSearchBarWithBack(context: context),
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
          text: "BLOCK",
          onPress: onTaped,
        ),
      ],
    );
  }

  _buildSearchBarWithBack({required BuildContext context}) {
    return Column(
      spacing: 8,
      children: [
        AppNavigationBar(
          title: "BLOCK AN ACCOUNTS",
          onLeftTap: () {
            Navigator.pop(context);
          },
        ),
        Container(
          color: Colors.transparent,
          height: 48,
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              Expanded(
                child: AppTextfield(
                  hintText: 'Search by name or number',
                  onChanged: (val) {},
                  prefixIcon: Icons.search,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
