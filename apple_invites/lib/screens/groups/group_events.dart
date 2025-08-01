import 'package:apple_invites/core/common/app_event_item.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/screens/helper/sticky_header_delegate.dart';
import 'package:apple_invites/screens/provider/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupEvents extends StatelessWidget {
  final String groupId;

  const GroupEvents({super.key, required this.groupId});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<EventProvider>();
    return AppScaffold(
      child: Stack(
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
      ),
    );
  }

  List<Widget> _buildEventSection({
    required String title,
    required EventProvider provider,
  }) {
    return [
      SliverPersistentHeader(
        pinned: true,
        delegate: StickyHeaderDelegate(
          height: 36,
          child: loadTitleText(title: title),
        ),
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
          title: "GROUP'S EVENTS",
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
