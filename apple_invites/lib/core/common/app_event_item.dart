import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/screens/models/event_model.dart';
import 'package:flutter/material.dart';

class AppEventItem extends StatelessWidget {
  final String? imageUrl;

  final EventModel event;

  const AppEventItem({super.key, this.imageUrl, required this.event});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(30),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          height: 190,
          width: double.infinity,
          child: loadAssetImage(name: event.imageUrl, fit: BoxFit.cover),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            spacing: 8,
            children: [
              Expanded(
                child: Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${event.name} (${event.category})",
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
                          color: Colors.white.withValues(alpha: 0.7),
                        ),
                        Text(
                          event.dateTime,
                          style: TextStyle(
                            fontFamily: fontRoboto,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 4,
                      children: [
                        Icon(
                          Icons.place_outlined,
                          size: 16,
                          color: Colors.white.withValues(alpha: 0.7),
                        ),
                        Text(
                          event.location,

                          style: TextStyle(
                            fontFamily: fontRoboto,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //loadCircleIcon(icon: Icons.mode_of_travel_sharp, radius: 16),
            ],
          ),
        ),
      ],
    );
  }
}
