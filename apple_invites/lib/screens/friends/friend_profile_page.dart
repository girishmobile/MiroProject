import 'package:apple_invites/core/common/app_horizontal_list.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_profile_image.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/screens/models/contact_model.dart';
import 'package:apple_invites/screens/provider/guest_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FriendProfilePage extends StatelessWidget {
  final ContactModel friend;

  const FriendProfilePage({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 48),
            child: _buildFancyProfile(context),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: AppNavigationBar(
              title: "FRIEND'S PROFILE",
              onLeftTap: () {
                Navigator.pop(context);
              },
              rightIcons: Icons.more_horiz_outlined,
              isRightIcon: true,
              onRightTap: () {
                loadBottomSheetWithSafeArea(
                  context: context,
                  child: _buildBottomContent(context),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _buildFancyProfile(BuildContext context) {
    final provider = context.read<GuestProvider>();

    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        loadGlassBackground(child: _buildProfileImage(context)),
        loadGlassBackground(
          child: _buildGroupList(),
          leftPadding: 8,
          rightPadding: 8,
          topPadding: 8,
          bottomPadding: 8,
        ),

        loadGlassBackground(
          child: AppHorizontalList(
            title: "Friends",
            guestList: provider.rejectedGuests,
            onPressed: () {
              Navigator.pushNamed(context, RouteName.friendOfFriendsPage);
            },
          ),
        ),

        loadGlassBackground(child: _buildEventList(context)),
      ],
    );
  }

  _buildProfileImage(BuildContext context) {
    final bool hasEmail = friend.email?.trim().isNotEmpty ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppProfileImage(imageUrl: friend.imageUrl, radius: 54),
        const SizedBox(height: 10),
        loadRowWithIcon(
          title: friend.name,
          textAlign: TextAlign.center,
          fontColor: Colors.white,
        ),
        if (hasEmail)
          loadSubTitleText(
            title: friend.email,
            fontColor: Colors.white.withValues(alpha: 0.8),
          ),
        loadSubTitleText(
          title: friend.phoneNumber,
          fontColor: Colors.white.withValues(alpha: 0.8),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 48,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              loadCircleIcon(
                icon: Icons.call,
                radius: 18,
                iconSize: 18,
                onTap: () {},
              ),
              loadCircleIcon(
                icon: Icons.message_outlined,
                radius: 18,
                iconSize: 18,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteName.friendMessages,
                    arguments: friend,
                  );
                },
              ),
              loadCircleIcon(
                icon: Icons.email_outlined,
                radius: 18,
                iconSize: 18,
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        loadGlassButton(text: "INVITE TO  EVENT", onPress: () {}, fontSize: 14),
      ],
    );
  }

  _buildGroupList() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 12,
      children: [
        Icon(Icons.people, color: Colors.white, size: 28),
        Text(
          "[#2]",
          style: TextStyle(
            fontFamily: fontRoboto,
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        Text(
          "SHARED GROUPS",
          style: TextStyle(
            fontFamily: fontRoboto,
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  _buildEventList(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            loadTitleText(title: "Events(#)", fontColor: Colors.white),
            SizedBox(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.friendsEventPage);
                },
                child: loadSubTitleText(
                  title: "See All",
                  fontColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [
              _buildNewEventItem(imageUrl: appEvent_2),
              _buildNewEventItem(imageUrl: appEvent_5),
              _buildNewEventItem(imageUrl: appEvent_6),
              _buildNewEventItem(imageUrl: appEvent_7),
              _buildNewEventItem(imageUrl: appEvent_8),
            ],
          ),
        ),
      ],
    );
  }

  _buildNewEventItem({required String imageUrl}) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withValues(alpha: 0.1),
            Colors.white.withValues(alpha: 0.05),
          ],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
                child: loadAssetImage(
                  name: imageUrl,
                  fit: BoxFit.cover,
                  height: 110,
                  width: 220,
                ),
              ),
              Positioned(
                bottom: -30, // pushes the icon below the image
                child: loadCircleIcon(
                  icon: Icons.event,
                  iconSize: 24,
                  radius: 22,
                  iconColor: Colors.white,
                  backgroundColor: Colors.white.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
          const SizedBox(height: 35), // space for the overlapping icon
          const Text(
            "Boulevard World",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: fontRoboto,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "January 12, 2025",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontFamily: fontRoboto,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 16,
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
        loadGlassButton(
          text: "REMOVE FROM FRIEND LIST",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
        loadGlassButton(
          text: "BLOCK USER",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
        loadGlassButton(
          text: "REPORT USER",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
        loadGlassButton(
          text: "CANCEL",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
