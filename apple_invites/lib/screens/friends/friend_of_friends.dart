import 'package:apple_invites/core/common/app_list_row.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/screens/provider/friend_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FriendOfFriends extends StatelessWidget {
  const FriendOfFriends({super.key});
  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyFriendList(context));
  }

  _buildFancyFriendList(BuildContext context) {
    final provider = Provider.of<FriendProvider>(context);

    return Stack(
      children: [
        //the scrollable list below.
        Padding(
          padding: const EdgeInsets.only(top: 104),
          child: CustomScrollView(
            slivers: [
              //SliverToBoxAdapter(child: _buildSearchBar(context: context)),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final friend = provider.listOfContacts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.friendProfilePage);
                    },
                    child: loadGlassBackground(child: AppListRow(data: friend)),
                  );
                }, childCount: provider.listOfContacts.length),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              AppNavigationBar(
                title: "LIST OF FRIENDS",
                onLeftTap: () {
                  Navigator.pop(context);
                },
              ),
              _buildSearchBar(context: context),
            ],
          ),
        ),
      ],
    );
  }

  _buildSearchBar({required BuildContext context}) {
    return Container(
      color: Colors.transparent,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          Expanded(
            child: AppTextfield(
              hintText: 'Search by name or number',

              onChanged: (val) {},
            ),
          ),
        ],
      ),
    );
  }
}

/**
 *  hintStyle: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.w500,
              ),
              bgColor: Colors.white.withAlpha(40),
 */
