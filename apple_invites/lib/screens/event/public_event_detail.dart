import 'package:apple_invites/core/common/app_horizontal_list.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/screens/provider/guest_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PublicEventDetail extends StatelessWidget {
  const PublicEventDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyPublicEvent(context));
  }

  _buildFancyPublicEvent(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: CustomScrollView(
            slivers: [
              SliverList.list(
                children: [
                  _buildEventPhoto(),
                  _buildEventTitle(context),
                  _buildAddress(context),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          child: AppNavigationBar(
            title: "PUBLIC EVENT INFO",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  _buildEventPhoto() {
    return loadGlassBackground(
      leftPadding: 0,
      rightPadding: 0,
      topPadding: 0,
      bottomPadding: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        clipBehavior: Clip.hardEdge,
        child: loadAssetImage(
          name: appEvent_6,
          fit: BoxFit.cover,
          height: photoSize,
        ),
      ),
    );
  }

  _buildEventTitle(BuildContext context) {
    final provider = context.read<GuestProvider>();
    return loadGlassBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          loadRowWithIcon(
            title: 'Your Event name is here.',
            iconName: Icons.event,
            fontSize: 16,
          ),
          loadDivider(),
          loadRowWithIcon(
            iconName: Icons.place_outlined,
            iconSize: 20,
            fontSize: 14,
            fontColor: Colors.white.withValues(alpha: 0.9),
            title: "I-404 Amazon world heritage site. San Francisco, USA",
          ),
          loadSubTitleText(
            fontSize: 14,
            fontColor: Colors.white.withValues(alpha: 0.9),
            title: "Description here...",
          ),
          loadGlassButton(
            icon: Icons.near_me_outlined,
            horizontalPadding: 8,
            text: "GET DIRECTION",
            fontSize: 14,
            onPress: () {},
          ),
          loadGlassButton(
            text: "SOUND LIKE FUN I'M IN",
            fontSize: 14,
            onPress: () {},
          ),
          loadRowWithIcon(
            iconName: Icons.person_2_outlined,
            fontSize: 14,
            iconSize: 20,
            fontColor: Colors.white.withValues(alpha: 0.9),
            title: "[10] guests",
          ),
          loadRowWithIcon(
            iconName: Icons.calendar_month_outlined,
            fontSize: 14,
            iconSize: 20,
            fontColor: Colors.white.withValues(alpha: 0.9),
            title: "02-July-2025 10:10 AM",
          ),
          AppHorizontalList(
            title: "Who is going?",
            guestList: provider.acceptedGuests,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  _buildAddress(BuildContext context) {
    return loadGlassBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          loadTitleText(title: "Address", fontSize: 18),
          loadRowWithIcon(
            fontSize: 14,
            title: "1234 Elm Street,Springfield, IL 62704,USA",
            iconName: Icons.place_outlined,
          ),
          Container(
            color: Colors.white.withAlpha(40),
            width: double.infinity,
            alignment: Alignment.center,
            height: 210,
            child: Text(
              "Map here...",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontFamily: fontRoboto,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
