import 'package:apple_invites/core/common/app_list_row.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/screens/provider/friend_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FriendActivity extends StatelessWidget {
  const FriendActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyFriendActivity(context));
  }

  Widget _buildFancyFriendActivity(BuildContext context) {
    final provider = Provider.of<FriendProvider>(context);

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: ListView.builder(
            itemCount: provider.listOfContacts.length,
            itemBuilder: (context, index) {
              final contact = provider.listOfContacts[index];
              return loadGlassBackground(child: AppListRow(data: contact));
            },
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: AppNavigationBar(
            title: "FRIEND'S ACTIVITY",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
