import 'dart:ui';

import 'package:apple_invites/core/common/app_event_item.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/screens/provider/event_provider.dart';
import 'package:apple_invites/screens/provider/public_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PublicEventPage extends StatelessWidget {
  const PublicEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyPublicEvent(context));
  }

  _buildFancyPublicEvent(BuildContext context) {
    final provider = context.read<EventProvider>();

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 154),
          child: CustomScrollView(
            slivers: [
              _buildEventSection(title: "Upcoming", provider: provider),
              _buildEventSection(title: "Popular", provider: provider),
              _buildEventSection(title: "Past Event", provider: provider),
            ],
          ),
        ),
        Positioned(left: 0, top: 0, right: 0, child: _buildSearchBar(context)),
      ],
    );
  }

  Widget _buildEventSection({
    required String title,
    required EventProvider provider,
  }) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: fontRoboto,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          );
        } else {
          final data = provider.listOfEvents[index - 1];

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
        }
      }, childCount: provider.listOfEvents.length + 1),
    );
  }

  _buildSearchBar(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        AppNavigationBar(
          title: "PUBLIC EVENTS",
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
        _buildFilterBar(context),
      ],
    );
  }

  Widget _buildFilterBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 40,
      width: double.infinity,
      color: Colors.transparent,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        //padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Row(
          children: [
            _buildGlassEffect(
              label: "Sort",
              onPress: () {
                customGlassDialogWithChild(
                  context: context,
                  child: _sortOptions(context),
                );
              },
            ),
            _buildGlassEffect(
              label: "Distance",
              onPress: () {
                customGlassDialogWithChild(
                  context: context,
                  child: _distanceOptions(context),
                );
              },
            ),
            _buildGlassEffect(
              label: "Event Category",
              onPress: () {
                customGlassDialogWithChild(
                  context: context,
                  child: Consumer<PublicProvider>(
                    builder:
                        (context, provider, _) =>
                            _eventCategoryOptions(context),
                  ),
                );
              },
            ),
            _buildGlassEffect(
              label: "Status",
              onPress: () {
                customGlassDialogWithChild(
                  context: context,
                  child: _eventStatusOptions(context),
                );
              },
            ),
            _buildGlassEffect(
              label: "Days",
              onPress: () {
                customGlassDialogWithChild(
                  context: context,
                  child: _eventDayOptions(context),
                );
              },
            ),
            _buildGlassEffect(
              label: "Times",
              onPress: () {
                customGlassDialogWithChild(
                  context: context,
                  child: _eventTimeOptions(context),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _sortOptions(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: loadTitleText(title: "Sort By"),
                ),
              ],
            ),
            loadSubTitleText(
              title: "Choose how you want to arrange the event list",
            ),
          ],
        ),

        loadGlassButton(
          text: "Ascending Order",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
        loadGlassButton(
          text: "Descending Order",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
        loadGlassButton(
          text: "Popular",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
        loadGlassButton(
          text: "Cancel",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  _distanceOptions(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        loadTitleText(title: "Sort By Distance"),

        loadGlassButton(
          text: "Nearest",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
        loadGlassButton(
          text: "Within 10 miles",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
        loadGlassButton(
          text: "Within 50 miles",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
        loadGlassButton(
          text: "Within 100 miles",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
        loadGlassButton(
          text: "Cancel",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  _eventCategoryOptions(BuildContext context) {
    final provider = Provider.of<PublicProvider>(context, listen: false);
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        loadTitleText(title: "Sort By Category"),

        SizedBox(
          height: 260,
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  provider.listOfCategory.map((category) {
                    final isSelected =
                        provider.selectedCategory == category.name;
                    return _buildGlassChip(
                      category: category.name,
                      isSelected: isSelected,
                      onTap: () {
                        provider.setSelectedCategory(category.name);
                      },
                    );
                  }).toList(),
            ),
          ),
        ),
        loadGlassButton(
          text: "Apply",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),

        provider.selectedCategory == null || provider.selectedCategory == ""
            ? loadGlassButton(
              text: 'Close',
              fontSize: 14,
              onPress: () {
                provider.setSelectedCategory(""); // or ""
                _buildNavigatorPop(context);
              },
            )
            : loadGlassButton(
              text: "Clear",
              fontSize: 14,
              onPress: () {
                provider.setSelectedCategory(""); // or ""
              },
            ),
      ],
    );
  }

  _buildNavigatorPop(BuildContext context) async {
    await Future.delayed(Duration(milliseconds: 150));
    if (context.mounted) {
      Navigator.pop(context);
    }
  }

  Widget _buildGlassChip({
    required String category,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? Colors.white : Colors.white.withAlpha(40),
            ),
            gradient: appGradient,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 4,
                  children: [
                    if (isSelected) ...[
                      const Icon(
                        Icons.check_circle_rounded,
                        size: 16,
                        color: Colors.white,
                      ),
                    ],
                    Text(
                      category,
                      style: TextStyle(
                        fontFamily: fontRoboto,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.02,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _eventStatusOptions(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        loadTitleText(title: "Sort By Status"),

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
          text: "Upcoming",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
        loadGlassButton(
          text: "Popular",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
        loadGlassButton(
          text: "Cancel",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  _eventDayOptions(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        loadTitleText(title: "Sort By Day"),
        // loadSubTitleText(
        //   title: "Choose how you want to arrange the event list",
        // ),
        loadGlassButton(
          text: "Today",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
        loadGlassButton(
          text: "Tomorrow",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
        loadGlassButton(
          text: "This week",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
        loadGlassButton(
          text: "This month",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
        loadGlassButton(
          text: "Cancel",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  _eventTimeOptions(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        loadTitleText(title: "Sort By Time"),
        loadGlassButton(
          icon: Icons.wb_twilight,
          text: "Morning",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
        loadGlassButton(
          icon: Icons.wb_sunny,
          text: "Afternoon",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
        loadGlassButton(
          icon: Icons.wb_twighlight,

          text: "Noon",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
        loadGlassButton(
          icon: Icons.nightlight_outlined,
          text: "Night",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),

        loadGlassButton(
          icon: Icons.close_outlined,
          text: "Cancel",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  _buildGlassEffect({required VoidCallback onPress, required String label}) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white.withAlpha(40)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withValues(alpha: 0.1),
                Colors.white.withValues(alpha: 0.05),
              ],
            ),
          ),
          child: ElevatedButton(
            onPressed: onPress,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: fontRoboto,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.white,
                    letterSpacing: 1.02,
                  ),
                  textAlign: TextAlign.left,
                ),
                Icon(Icons.arrow_drop_down, size: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
