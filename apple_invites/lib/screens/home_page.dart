import 'package:apple_invites/core/common/app_event_item.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/screens/helper/sticky_header_delegate.dart';
import 'package:apple_invites/screens/provider/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildFancyEventList(context);
  }

  _buildFancyEventList(BuildContext context) {
    final provider = context.read<EventProvider>();

    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: StickyHeaderDelegate(
            height: 48,
            child: _buildFilterView(context),
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final event = provider.listOfEvents[index];
            return GestureDetector(
              onTap: () {
                if (event.host) {
                  Navigator.pushNamed(
                    context,
                    RouteName.eventDetailPage,
                    arguments: event.id,
                  );
                } else {
                  Navigator.pushNamed(
                    context,
                    RouteName.eventDetailNotHost,
                    arguments: event,
                  );
                }
              },
              child: loadGlassBackground(
                leftPadding: 0,
                rightPadding: 0,
                topPadding: 0,
                bottomPadding: 0,
                child: AppEventItem(event: event),
              ),
            );
          }, childCount: provider.listOfEvents.length),
        ),
      ],
    );
  }

  _buildFilterView(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 48,
      child: Row(
        children: [
          Expanded(
            child: Text(
              "YOUR EVENTS",
              style: TextStyle(
                color: Colors.white,
                fontFamily: fontRoboto,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
          loadCircleIcon(
            icon: Icons.filter_alt_outlined,
            radius: 18,
            iconSize: 22,
            onTap: () {
              customGlassDialogWithChild(
                context: context,
                child: _filterOptions(context),
              );
            },
          ),
          SizedBox(width: 10),
          loadCircleIcon(
            icon: Icons.calendar_month_outlined,
            radius: 18,
            iconSize: 22,
            onTap: () {
              showAlertWithGlassEffect(
                context: context,
                title: "Sync GamePlan account with calendar",
                message:
                    "You have the option to sync your calendar to GamePlan so that event creators can see your availability and choose event times when you're free.",
                onConfirm: () {
                  Navigator.pop(context);
                },
                leftbuttonText: "Sync later",
                rightbuttonText: "Sync now",
              );
            },
          ),
        ],
      ),
    );
  }

  _filterOptions(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        //loadTitleText(title: "Choose "),
        Row(
          children: [
            Expanded(
              child: loadTitleText(
                title: "Choose how you want to arrange the event list",
              ),
            ),
            loadCircleIcon(
              icon: Icons.close,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),

        loadGlassButton(
          text: "Popular Event",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
        loadGlassButton(
          text: "Public Event",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
        loadGlassButton(
          text: "Free Event",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
        loadGlassButton(
          text: "Paid Event",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
        loadGlassButton(
          text: "Nearest",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
