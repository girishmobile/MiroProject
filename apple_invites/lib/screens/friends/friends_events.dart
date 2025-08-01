import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:flutter/material.dart';

class FriendsEvents extends StatelessWidget {
  const FriendsEvents({super.key});
  double screenHeight(BuildContext context, double percent) {
    return MediaQuery.of(context).size.height * percent;
  }

  double screenWidth(BuildContext context, double percent) {
    return MediaQuery.of(context).size.width * percent;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyFriendList(context));
  }

  _buildFancyFriendList(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: CustomScrollView(
            slivers: [
              SliverList.list(
                children: [
                  loadGlassBackground(
                    child: _buildUpComingEvent(context),
                    leftPadding: 8,
                    rightPadding: 8,
                    topPadding: 8,
                    bottomPadding: 8,
                  ),
                  loadGlassBackground(
                    child: _buildPastEvent(context),
                    leftPadding: 8,
                    rightPadding: 8,
                    topPadding: 8,
                    bottomPadding: 8,
                  ),
                  loadGlassBackground(
                    child: _buildPopularEvent(context),
                    leftPadding: 8,
                    rightPadding: 8,
                    topPadding: 8,
                    bottomPadding: 8,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppNavigationBar(
            title: "FRIEND'S EVENTS",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  _buildUpComingEvent(BuildContext context) {
    return Column(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 8),
          child: loadRowWithIcon(title: 'Upcoming Events'),
        ),
        SizedBox(
          height: 280,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _buildEventItem();
            },
            separatorBuilder: (_, _) => SizedBox(width: 12),
            itemCount: 9,
          ),
        ),
      ],
    );
  }

  _buildPopularEvent(BuildContext context) {
    return Column(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 8),
          child: loadRowWithIcon(title: 'Popular Events'),
        ),
        SizedBox(
          height: 280,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _buildEventItem();
            },
            separatorBuilder: (_, _) => SizedBox(width: 12),
            itemCount: 9,
          ),
        ),
      ],
    );
  }

  _buildPastEvent(BuildContext context) {
    return Column(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 8),
          child: loadRowWithIcon(title: 'Past Events'),
        ),
        SizedBox(
          height: 280,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _buildEventItem();
            },
            separatorBuilder: (_, _) => SizedBox(width: 12),
            itemCount: 9,
          ),
        ),
      ],
    );
  }

  _buildEventItem() {
    return SizedBox(
      width: 320,
      child: Card(
        color: Colors.white.withAlpha(30),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            loadAssetImage(
              name: appEvent_4,
              width: double.infinity,
              height: 160,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Enjoy the monsoon season! Let's go to the native place goa",
                    style: TextStyle(
                      fontFamily: fontRoboto,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    spacing: 4,
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 16,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                      Text(
                        "09-Jun-2025 09:AM",
                        style: TextStyle(
                          fontFamily: fontRoboto,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    spacing: 4,
                    children: [
                      Icon(Icons.place_outlined, size: 16, color: Colors.white),
                      Expanded(
                        child: Text(
                          "New York, NY, Mercury Lounge plaza near NYK showroom behind of have fun club other then call to me",
                          style: TextStyle(
                            fontFamily: fontRoboto,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
