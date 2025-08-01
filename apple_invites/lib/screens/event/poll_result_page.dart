import 'dart:ui';

import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_text_widget.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/screens/models/event_model.dart';
import 'package:apple_invites/screens/provider/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PollResultPage extends StatelessWidget {
  final String eventId;
  const PollResultPage({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    final event = context.read<EventProvider>().findEventById(eventId);

    List<Map<String, dynamic>> cityPoll = [
      {"city": "New York City", "votes": 75},
      {"city": "Los Angeles", "votes": 65},
      {"city": "Chicago", "votes": 10},
      {"city": "Houston", "votes": 20},
      {"city": "San Francisco", "votes": 55},
    ];
    return AppScaffold(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 48),
            child: CustomScrollView(
              slivers: [
                SliverList.list(
                  children:
                      event != null
                          ? [
                            _buildPollResultHeader(),
                            _numberOfVoteTitle(),
                            _buildVotingPlace(cityPoll),
                            _buildChooseVenue(context, event),
                          ]
                          : [
                            loadEmptyView(
                              emptyIcon: Icons.event_busy_outlined,
                              title: "NO EVENT FOUND",
                              message:
                                  "Event not found please try again latter...",
                              buttonTitle: "GO BACK",
                              onPressed: () {},
                            ),
                          ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: AppNavigationBar(
              title: event?.name ?? 'Event not found',
              onLeftTap: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }

  _buildPollResultHeader() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.transparent,
      child: AppTextWidget(
        alignment: TextAlign.start,
        text: 'POLL RESULT',
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  _numberOfVoteTitle() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Align(
        alignment: Alignment.centerRight,
        child: loadSubTitleText(
          fontColor: Colors.white.withValues(alpha: 0.7),
          title: "999 of potential total votes",
          fontSize: 12,
        ),
      ),
    );
  }

  _buildVotingPlace(List<Map<String, dynamic>> cityPoll) {
    return loadGlassBackground(
      topMargin: 8,
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        primary: false,
        itemCount: cityPoll.length,
        itemBuilder: (context, index) {
          final poll = cityPoll[index];
          return _buildPollItem(city: poll['city'], percentage: poll['votes']);
        },
        separatorBuilder: (_, _) => SizedBox(height: 12),
      ),
    );
  }

  _buildPollItem({required String city, required int percentage}) {
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
        ), // Outer border
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: percentage / 100.0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      // color: Colors.white.withAlpha(20),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
          ),
          //Foreground content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      city,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: fontRoboto,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    "$percentage%",
                    style: TextStyle(
                      color: Colors.white70,
                      fontFamily: fontRoboto,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildChooseVenue(BuildContext context, EventModel event) {
    final provider = Provider.of<EventProvider>(context);

    final chooseVenue = event.chooseVenue;

    return loadGlassBackground(
      child: Column(
        spacing: 16,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          loadTextField(
            text: provider.selectedVenue,
            hintText: "Choose Venue",
            prefixIcon: Icons.place_outlined,
            suffixIcon: Icons.arrow_drop_down,
            readOnly: true,
            onTaped: () {
              provider.setShowChooseVenue(!provider.showVenues);
            },
          ),
          if (provider.showVenues) ...[
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  (chooseVenue ?? []).map((venue) {
                    final isSelected = provider.selectedVenue == venue;
                    return _buildGlassChip(
                      venue: venue,
                      isSelected: isSelected,
                      onTap: () => provider.setSelectedVenue(venue),
                    );
                  }).toList(),
            ),
          ],

          AppTextfield(
            hintText: 'If Other, please type here',
            prefixIcon: Icons.edit_outlined,
          ),
          loadGlassButton(
            text: "Save Changes & Go to Event",
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildGlassChip({
    required String venue,
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
                      venue,
                      style: TextStyle(
                        fontFamily: fontRoboto,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
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
}

/**
 * progress bar
 *  // ListView.builder(
                  //   shrinkWrap: true,
                  //   primary: false,
                  //   itemCount: locations.length,
                  //   itemBuilder: (context, index) {
                  //     return loadGlassBackground(
                  //       child: _loadPollItem(index: index),
                  //     );
                  //   },
                  // ),
                   _loadPollItem({int index = 0}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: loadSubTitleText(
                title: locations[index],
                fontSize: 14,
                fontColor: Colors.white.withValues(alpha: 0.9),
              ),
            ),
            Expanded(
              child: loadSubTitleText(
                title: '#10 of votes',
                fontSize: 12,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        LinearProgressIndicator(
          minHeight: 8,
          borderRadius: BorderRadius.circular(30),
          value: 65 / 100,
          backgroundColor: Colors.white.withValues(alpha: 0.2),
          valueColor: AlwaysStoppedAnimation(
            Colors.white.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }
 */
