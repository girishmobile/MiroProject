import 'package:apple_invites/core/common/app_list_row.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/screens/provider/friend_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FriendProvider>(
      builder: (context, provider, child) {
        return provider.isEmptyFriend
            ? loadEmptyView(
              title: "No Friends Yet",
              buttonTitle: 'ADD FRIEND',
              message: 'Start by adding some friends to see them here.',
              emptyIcon: Icons.group_off_outlined,
              onPressed: () {
                provider.setIsEmptyFriends(false);
              },
            )
            : _buildFancyFriendList(context, provider);
      },
    );
  }

  _buildFancyFriendList(BuildContext context, FriendProvider provider) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 56),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              //SliverToBoxAdapter(child: _buildSearchBar(context: context)),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final friend = provider.listOfContacts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteName.friendProfilePage,
                        arguments: friend,
                      );
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
          child: _buildSearchBar(context: context),
        ),
      ],
    );
  }

  _buildSearchBar({required BuildContext context}) {
    return Container(
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
          loadCircleIcon(
            radius: 18,
            icon: Icons.person_add_alt_1,
            onTap: () {
              loadBottomSheetWithSafeArea(
                context: context,
                child: _buildBottomSheetItem(context),
              );
            },
          ),
        ],
      ),
    );
  }

  _buildBottomSheetItem(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: 40,
            height: 4,
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        Text(
          'Add Friends',
          style: TextStyle(
            color: Colors.white,
            fontFamily: fontRoboto,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.05,
          ),
        ),
        const SizedBox(height: 16),
        _buildBottomsheetRow(
          icon: Icons.phone,
          title: "Add by phone number",
          onTapped: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, RouteName.addFriendByPhone);
          },
        ),
        const SizedBox(height: 4),
        loadDivider(),
        const SizedBox(height: 4),
        _buildBottomsheetRow(
          icon: Icons.contacts,
          title: "Add from contacts",
          onTapped: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, RouteName.contactPage);
          },
        ),
        const SizedBox(height: 4),
        loadDivider(),
        SizedBox(height: 16),
        Text(
          'Invite via',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontFamily: fontRoboto,
            letterSpacing: 1.02,
          ),
        ),
        const SizedBox(height: 12),
        //this is the icon row
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: _buildInviteOption(
                  icon: Icons.wallet,
                  label: 'WhatsApp',
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.globalEventPage);
                  },
                ),
              ),
              Expanded(
                child: _buildInviteOption(
                  icon: Icons.facebook,
                  label: 'Facebook',
                  onTap: () {},
                ),
              ),
              Expanded(
                child: _buildInviteOption(
                  icon: Icons.message,
                  label: 'Messages',
                  onTap: () {},
                ),
              ),
              Expanded(
                child: _buildInviteOption(
                  icon: Icons.share,
                  label: 'Share',
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInviteOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white.withValues(alpha: 0.3),
            child: Icon(icon, size: 24, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 10,
              fontFamily: fontRoboto,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomsheetRow({
    required IconData icon,
    required String title,
    required VoidCallback onTapped,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: Colors.white.withValues(alpha: 0.1),
        splashColor: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        onTap: onTapped,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            spacing: 12,
            children: [
              loadCircleIcon(icon: icon, iconColor: Colors.white),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: fontRoboto,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.02,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
