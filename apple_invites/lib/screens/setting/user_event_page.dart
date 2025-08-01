import 'dart:ui';

import 'package:apple_invites/core/common/app_event_item.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/screens/provider/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserEventPage extends StatelessWidget {
  const UserEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyUserEvent(context));
  }

  _buildFancyUserEvent(BuildContext context) {
    final provider = context.read<EventProvider>();
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 104),
          child: CustomScrollView(
            slivers: [
              ..._buildEventSection(title: "UPCOMING", provider: provider),
              ..._buildEventSection(title: "PAST EVENT", provider: provider),
            ],
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          right: 0,
          child: _buildSearchBarWithTitle(context),
        ),
      ],
    );
  }

  List<Widget> _buildEventSection({
    required String title,
    required EventProvider provider,
  }) {
    return [
      SliverPersistentHeader(
        pinned: true,
        delegate: _StickyHeaderDelegate(title: title),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final data = provider.listOfEvents[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RouteName.publicEventDetail);
            },
            child: loadGlassBackground(
              leftPadding: 0,
              rightPadding: 0,
              topPadding: 0,
              bottomPadding: 0,

              child: AppEventItem(event: data),
            ),
          );
        }, childCount: provider.listOfEvents.length),
      ),
    ];
  }

  _buildSearchBarWithTitle(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        AppNavigationBar(
          title: "ALL EVENTS",
          onLeftTap: () {
            Navigator.pop(context);
          },
        ),
        Container(
          height: 48,
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              Expanded(
                child: AppTextfield(
                  hintText: 'Search by event name',
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

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;

  _StickyHeaderDelegate({required this.title});

  @override
  double get minExtent => 36;

  @override
  double get maxExtent => 36;
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ClipRRect(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          alignment: Alignment.centerLeft,
          child: loadTitleText(title: title),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return (oldDelegate as _StickyHeaderDelegate).title != title;
  }
}
