import 'package:apple_invites/core/components/components.dart';
import 'package:flutter/material.dart';

class AppEventRow extends StatelessWidget {
  final String eventImageUrl;

  const AppEventRow({super.key, required this.eventImageUrl});

  @override
  Widget build(BuildContext context) {
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
              name: eventImageUrl,
              width: double.infinity,
              height: 160,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 4,
                children: [
                  loadSubTitleText(
                    title:
                        "Enjoy the monsoon season! Let's go to the native place goa",
                    fontColor: Colors.white,
                    maxLines: 2,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    spacing: 4,
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 18,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                      loadSubTitleText(
                        title: "09-Jun-2025 09:AM",
                        fontColor: Colors.white,
                        fontSize: 12,
                      ),
                    ],
                  ),

                  Row(
                    spacing: 4,
                    children: [
                      Icon(Icons.place_outlined, size: 18, color: Colors.white),
                      Expanded(
                        child: loadSubTitleText(
                          title:
                              "New York, NY, Mercury Lounge plaza near NYK showroom behind of have fun club other then call to me",
                          fontColor: Colors.white,
                          fontSize: 12,
                          maxLines: 2,
                          textOverflow: TextOverflow.ellipsis,
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
