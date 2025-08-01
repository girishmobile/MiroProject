import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/screens/models/notification_model.dart';
import 'package:apple_invites/screens/models/notification_view_model.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  Map<String, List<NotificationModel>> groupOfNotification(
    List<NotificationModel> listOfNotification,
  ) {
    final Map<String, List<NotificationModel>> grouped = {};

    for (var notification in listOfNotification) {
      final now = DateTime.now();
      final date = notification.date;
      String key;
      if (date.day == now.day &&
          date.month == now.month &&
          date.year == now.year) {
        key = "Today";
      } else if (date.isAfter(now.subtract(Duration(days: 7)))) {
        key = "Last Week";
      } else {
        key = "Earlier";
      }
      grouped.putIfAbsent(key, () => []).add(notification);
    }
    return grouped;
  }

  Set<String> expandedIndexes = {};
  @override
  Widget build(BuildContext context) {
    final grouped = groupOfNotification(
      NotificationViewModel.listOfNotification,
    );
    return AppScaffold(child: _buildFancyNotificationList(context, grouped));
  }

  _buildFancyNotificationList(
    BuildContext context,
    Map<String, List<NotificationModel>> grouped,
  ) {
    return Stack(
      children: [
        //the scrollable list below.
        Padding(
          padding: const EdgeInsets.only(top: 104),
          child: CustomScrollView(
            slivers: [
              _buildNotificationSection(
                title: "Today",
                groupOfNotification: grouped['Today'] ?? [],
              ),
              _buildNotificationSection(
                title: "Last Week",
                groupOfNotification: grouped['Last Week'] ?? [],
              ),
              _buildNotificationSection(
                title: "Earlier",
                groupOfNotification: grouped['Earlier'] ?? [],
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

  _buildNotificationSection({
    required String title,
    required List<NotificationModel> groupOfNotification,
  }) {
    if (groupOfNotification.isEmpty) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'No $title notifications.',
            style: const TextStyle(color: Colors.white60, fontSize: 16),
          ),
        ),
      );
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: fontRoboto,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          );
        } else {
          final notification = groupOfNotification[index - 1];
          final isExpanded = expandedIndexes.contains(notification.id);

          return GestureDetector(
            onTap: () {
              setState(() {
                if (isExpanded) {
                  expandedIndexes.remove(notification.id);
                } else {
                  expandedIndexes.add(notification.id);
                }
              });
            },
            child: loadGlassBackground(
              child: _buildFancyListItem(notification, isExpanded),
            ),
          );
        }
      }, childCount: groupOfNotification.length + 1),
    );
  }

  _buildFancyListItem(NotificationModel notification, bool isExpanded) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      alignment: Alignment.topCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 8,
            children: [
              loadCircleIcon(
                icon: Icons.notifications,
                iconSize: 18,
                radius: 16,
              ),
              Expanded(
                child: Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      notification.title,
                      style: TextStyle(
                        fontFamily: fontRoboto,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Colors.white,
                        letterSpacing: 1.1,
                      ),
                    ),
                    Text(
                      notification.message,
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
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white.withAlpha(80),
                size: 16,
              ),
            ],
          ),
          if (isExpanded) ...[
            const SizedBox(height: 16),
            Row(
              spacing: 12,
              children: [
                Flexible(
                  child: loadGlassButton(
                    text: "Reject",
                    onPress: () {},
                    fontSize: 14,
                    verticalPadding: 8,
                  ),
                ),
                Flexible(
                  child: loadGlassButton(
                    text: "May be",
                    onPress: () {},
                    fontSize: 14,
                    verticalPadding: 8,
                  ),
                ),
                Flexible(
                  child: loadGlassButton(
                    text: "Accept",
                    onPress: () {},
                    fontSize: 14,
                    verticalPadding: 8,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  _buildSearchBar({required BuildContext context}) {
    return Column(
      spacing: 8,
      children: [
        AppNavigationBar(
          title: "NOTIFICATIONS",
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
