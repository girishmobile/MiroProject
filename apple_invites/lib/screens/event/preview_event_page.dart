import 'package:apple_invites/core/common/app_horizontal_list.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_text_widget.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/screens/provider/guest_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PreviewEventPage extends StatelessWidget {
  const PreviewEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyPreview(context));
  }

  _buildFancyPreview(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: CustomScrollView(
            slivers: [
              SliverList.list(
                children: [
                  _buildEventPhoto(),
                  _buildEventDetail(),
                  _buildFancyGuestList(context),
                  _buildSendEvent(),
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
            title: "PREVIEW",
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
          name: appEvent_2,
          fit: BoxFit.cover,
          height: photoSize,
        ),
      ),
    );
  }

  _buildEventDetail() {
    return loadGlassBackground(
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: loadTitleText(
                  title: "YOUR EVENT NAME",
                  fontColor: Colors.white,
                  fontSize: 18,
                  fontWight: FontWeight.w700,
                ),
              ),
              loadCircleIcon(icon: Icons.edit, radius: 18),
            ],
          ),
          AppTextWidget(
            text: "Enjoy the little things—they’re the big things.",
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),

          loadDivider(),
          Row(
            children: [
              Icon(Icons.calendar_month_outlined, color: Colors.white),
              SizedBox(width: 8),
              Expanded(
                child: AppTextWidget(
                  text: "27-May-2025",
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(Icons.watch_later_outlined, color: Colors.white),
              SizedBox(width: 8),
              Expanded(
                child: AppTextWidget(
                  text: "05:30 PM",
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          loadDivider(),
          Row(
            spacing: 8,
            children: [
              Icon(Icons.place_outlined, color: Colors.white),
              Expanded(
                child: AppTextWidget(
                  text: "I-404, Sunset Convention Center – Los Angeles, CA",
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          loadDivider(),
          Row(
            spacing: 8,
            children: [
              Icon(Icons.payment_outlined, color: Colors.white),
              Expanded(
                child: AppTextWidget(
                  text: "\$09.09",
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          loadDivider(),
          Row(
            spacing: 8,
            children: [
              Icon(Icons.privacy_tip_outlined, color: Colors.white),
              Expanded(
                child: AppTextWidget(
                  text: "Private",
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildFancyGuestList(BuildContext context) {
    final provider = Provider.of<GuestProvider>(context);
    return loadGlassBackground(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppHorizontalList(
            title: "GUEST LIST",
            guestList: provider.acceptedGuests,
            onPressed: () {
              Navigator.pushNamed(context, RouteName.acceptedGuest);
            },
          ),
          loadGlassButton(text: "ADD GUEST", onPress: () {}),
          loadSubTitleText(
            fontColor: Colors.white.withValues(alpha: 0.7),
            title:
                "Easily manage your guest list by adding new members or removing existing ones. Make sure your event includes everyone you care about",
          ),
          loadDivider(),
          loadSubTitleText(
            fontColor: Colors.white.withValues(alpha: 0.7),
            title: "Guests will not cover expenses post-event",
          ),
        ],
      ),
    );
  }

  _buildSendEvent() {
    return loadGlassBackground(
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          loadTitleText(title: "SEND TO GUESTS", fontSize: 16),
          loadGlassButton(text: "SEND TO GUESTS", onPress: () {}),
          loadSubTitleText(
            fontColor: Colors.white.withValues(alpha: 0.7),
            title:
                "Ready to share this event with your guests? Review the details and send the invitation.",
          ),
        ],
      ),
    );
  }
}
