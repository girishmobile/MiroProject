import 'package:apple_invites/core/common/app_horizontal_list.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_text_widget.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/screens/models/event_model.dart';
import 'package:apple_invites/screens/provider/event_provider.dart';
import 'package:apple_invites/screens/provider/guest_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final List<Map<String, dynamic>> itemList = [
  {
    "item": "Water Bottles",
    "qty": 24,
    "description": "500ml packaged water",
    "contribution": "₹300",
    "locked": false,
    "contributor": "Available",
  },
  {
    "item": "Paper Plates",
    "qty": 50,
    "description": "Disposable, eco-friendly plates",
    "contribution": "₹150",
    "locked": true,
    "contributor": "Host",
  },
  {
    "item": "Samosas",
    "qty": 40,
    "description": "Veg stuffed snacks (2 per person)",
    "contribution": "₹500",
    "locked": true,
    "contributor": "Rena Shah",
  },
  {
    "item": "Soft Drinks",
    "qty": 12,
    "description": "1-liter assorted soda bottles",
    "contribution": "₹360",
    "locked": false,
    "contributor": "Available",
  },
  {
    "item": "Cutlery Set",
    "qty": 50,
    "description": "Spoons, forks, knives",
    "contribution": "Provided by host",
    "locked": true,
    "contributor": "Host",
  },
  {
    "item": "Veg Biryani",
    "qty": 1,
    "description": "Serves 20 guests",
    "contribution": "₹1200",
    "locked": true,
    "contributor": "Adit Verma",
  },
  {
    "item": "Napkins",
    "qty": 100,
    "description": "Tissue paper napkins",
    "contribution": "₹100",
    "locked": false,
    "contributor": "Host(Locked)",
  },
  {
    "item": "Dessert (Gulab Jamun)",
    "qty": 40,
    "description": "2 pieces per guest",
    "contribution": "₹400",
    "locked": true,
    "contributor": "Prima Melon",
  },
  {
    "item": "Chairs",
    "qty": 20,
    "description": "Foldable rental chairs",
    "contribution": "₹1000",
    "locked": true,
    "contributor": "Vendor Reserved",
  },
  {
    "item": "Ice Cubes",
    "qty": 5,
    "description": "2kg bags for cooling drinks",
    "contribution": "₹200",
    "locked": false,
    "contributor": "Available",
  },
];

List<Map<String, dynamic>> cityPoll = [
  {"city": "New York City", "votes": 75},
  {"city": "Los Angeles", "votes": 65},
  {"city": "Chicago", "votes": 30},
  {"city": "Houston", "votes": 40},
  {"city": "San Francisco", "votes": 55},
];

class EventDetailNotHosted extends StatelessWidget {
  final EventModel event;
  const EventDetailNotHosted({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    return AppScaffold(child: _buildFancyEvent(context, provider));
  }

  _buildFancyEvent(BuildContext context, EventProvider eventProvider) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: CustomScrollView(
            slivers: [
              SliverList.list(
                children: [
                  _buildEventPhoto(),
                  _buildEventTitle(context, eventProvider),
                  _buildInviteResponse(eventProvider),
                  _buildGuestList(context),
                  _buildEventRequestedItem(eventProvider),

                  _buildLocationView(),
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
            title: "EVENT INFO",
            onLeftTap: () {
              Navigator.pop(context);
            },
            //isRightIcon: true,
            rightIcons: Icons.logout_outlined,
            onRightTap: () {},
          ),
        ),
      ],
    );
  }

  _buildEventPhoto() {
    return loadGlassBackground(
      leftPadding: 0,
      rightPadding: 0,
      bottomPadding: 0,
      topPadding: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        clipBehavior: Clip.hardEdge,
        child: loadAssetImage(
          name: event.imageUrl,
          fit: BoxFit.cover,
          height: photoSize,
        ),
      ),
    );
  }

  _buildEventTitle(BuildContext context, EventProvider provider) {
    return loadGlassBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          loadRowWithIcon(title: event.name, iconName: Icons.event_outlined),
          loadDivider(),
          loadRowWithIcon(
            iconName: Icons.place_outlined,
            iconSize: 20,
            fontSize: 14,
            fontColor: Colors.white.withValues(alpha: 0.7),
            title: event.location,
          ),
          loadGlassButton(
            horizontalPadding: 8,
            verticalPadding: 12,
            text: "Vote on Venue",
            fontSize: 14,
            onPress: () {
              provider.setIsPollVoting(!provider.isPollVote);
            },
          ),
          if (provider.isPollVote) ...[_buildPollVoting()],
          loadDivider(),
          loadRowWithIcon(
            iconName: Icons.calendar_month_outlined,
            fontSize: 12,
            iconSize: 20,
            fontColor: Colors.white.withValues(alpha: 0.7),
            title: event.dateTime,
          ),
          _buildActionSection(context),
        ],
      ),
    );
  }

  _buildActionSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 16,
      children: [
        Row(
          spacing: 16,
          children: [
            Flexible(
              child: loadGlassButton(
                text: "Buy Ticket",
                fontSize: 14,
                onPress: () {
                  Navigator.pushNamed(context, RouteName.buyTicketPage);
                },
              ),
            ),
            Flexible(
              child: loadGlassButton(
                text: "Contact Host",
                fontSize: 14,
                onPress: () {
                  Navigator.pushNamed(context, RouteName.hostProfilePage);
                },
                horizontalPadding: 8,
              ),
            ),
          ],
        ),
      ],
    );
  }

  _buildInviteResponse(EventProvider provider) {
    return loadGlassBackground(
      child: Row(
        spacing: 16,
        children: [
          Expanded(child: loadTitleText(title: "Invite Response")),
          loadCircleIcon(
            icon: Icons.check_circle_rounded,
            iconColor:
                provider.isAcceptedEvent == true
                    ? Colors.white
                    : Colors.white.withValues(alpha: 0.4),
            //backgroundColor: Colors.white,
            radius: 20,
            iconSize: 24,
            onTap: () {
              // setState(() {
              //   isAccepted = isAccepted == true ? null : true;
              // });
              provider.setIsAcceptedEvent(
                provider.isAcceptedEvent == true ? null : true,
              );
            },
          ),
          loadCircleIcon(
            icon: Icons.cancel_rounded,
            iconColor:
                provider.isAcceptedEvent == false
                    ? Colors.white
                    : Colors.white.withValues(alpha: 0.4),
            iconSize: 24,
            radius: 20,
            onTap: () {
              provider.setIsAcceptedEvent(
                provider.isAcceptedEvent == false ? null : false,
              );
            },
          ),
        ],
      ),
    );
  }

  _buildGuestList(BuildContext context) {
    final provider = context.read<GuestProvider>();

    return loadGlassBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          loadRowWithIcon(
            title: 'GUEST LIST',
            iconName: Icons.people_alt_outlined,
          ),
          const SizedBox(height: 16),
          loadDivider(),
          const SizedBox(height: 4),
          AppHorizontalList(
            title: "Accepted",
            guestList: provider.acceptedGuests,
            onPressed: () {
              Navigator.pushNamed(context, RouteName.acceptedGuest);
            },
          ),
          const SizedBox(height: 20),
          loadDivider(),
          const SizedBox(height: 4),
          AppHorizontalList(
            title: "Rejected",
            guestList: provider.rejectedGuests,
            onPressed: () {
              Navigator.pushNamed(context, RouteName.rejectedGuest);
            },
          ),
        ],
      ),
    );
  }

  _buildEventRequestedItem(EventProvider provider) {
    return loadGlassBackground(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        //spacing: 16,
        children: [
          loadRowWithIcon(
            title: "Itemization List",
            iconName: Icons.list_alt_outlined,
          ),
          const SizedBox(height: 12),
          loadSubTitleText(title: "Guests Choose From List"),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: provider.listOfItems1.length,
            itemBuilder: (context, index) {
              final item = provider.listOfItems1[index];

              return loadGlassBackground(
                leftMargin: 0,
                rightMargin: 0,
                child: Column(
                  spacing: 4,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: AppTextWidget(
                            text: item.name,
                            color: Colors.white.withValues(alpha: 0.9),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        AppTextWidget(
                          text: "Qty:- ${item.qty}",
                          color: Colors.white.withValues(alpha: 0.9),
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    SizedBox(height: 0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            spacing: 4,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextWidget(
                                text: "Des:- ${item.description}",
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              AppTextWidget(
                                text: "Contributor:- ${item.contributor}",
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        // Edit item
                        loadCircleIcon(
                          onTap: () {},
                          radius: 14,
                          icon: Icons.radio_button_off,
                          iconSize: 20,
                          iconColor: Colors.white.withValues(alpha: 0.9),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  _buildPollVoting() {
    return loadGlassBackground(
      leftMargin: 0,
      rightMargin: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 16,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: loadRowWithIcon(
                  title: "Poll Voting",
                  iconName: Icons.poll_outlined,
                ),
              ),
              loadSubTitleText(
                title: 'Vote on Venue',
                fontSize: 12,
                fontColor: Colors.white,
              ),
            ],
          ),

          ListView.separated(
            separatorBuilder: (_, _) => SizedBox(height: 8),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            primary: false,
            itemCount: cityPoll.length,
            itemBuilder: (context, index) {
              final poll = cityPoll[index];
              return _buildPollItem(
                city: poll['city'],
                percentage: poll['votes'],
                onTap: () {},
              );
            },
          ),
        ],
      ),
    );
  }

  _buildPollItem({
    required String city,
    required int percentage,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 48,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Stack(
            children: [
              Positioned.fill(
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: percentage / 100.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(30),
                      borderRadius: BorderRadius.circular(8),
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
        ),
      ),
    );
  }

  _buildLocationView() {
    return loadGlassBackground(
      child: Column(
        spacing: 16,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          loadSubTitleText(title: "Event address here..."),
          Container(
            height: 210,
            width: double.infinity,
            color: Colors.white.withAlpha(40),
            child: Center(child: loadTitleText(title: "Map")),
          ),
        ],
      ),
    );
  }
}
