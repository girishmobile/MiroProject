import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/screens/models/guest_model.dart';
import 'package:flutter/material.dart';

class AppGuestRow extends StatelessWidget {
  final GuestModel guest;
  const AppGuestRow({super.key, required this.guest});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        loadCircleImage(text: guest.name, icon: null, imageUrl: guest.imageUrl),
        Expanded(
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                guest.name,
                style: TextStyle(
                  fontFamily: fontRoboto,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.white,
                  letterSpacing: 1.1,
                ),
              ),
              (guest.subTitle != null && guest.subTitle!.trim().isNotEmpty)
                  ? Text(
                    guest.subTitle ?? "",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: fontRoboto,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.white.withValues(alpha: 0.8),
                      letterSpacing: 1.1,
                    ),
                  )
                  : SizedBox.shrink(),
            ],
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: Colors.white.withAlpha(80),
          size: 16,
        ),
      ],
    );
  }
}
