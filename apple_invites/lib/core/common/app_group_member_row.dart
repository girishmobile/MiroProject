import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/screens/models/group_member_model.dart';
import 'package:flutter/material.dart';

class AppGroupMemberRow extends StatelessWidget {
  final GroupMemberModel member;
  const AppGroupMemberRow({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    final bool hasAdmin = member.type?.trim().isNotEmpty ?? false;

    return Row(
      spacing: 8,
      children: [
        loadCircleImage(
          text: member.name,
          icon: null,
          imageUrl: member.imageUrl,
        ),
        Expanded(
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                member.name,
                style: TextStyle(
                  fontFamily: fontRoboto,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.white,
                  letterSpacing: 1.1,
                ),
              ),
              Text(
                member.phone,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: fontRoboto,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.white.withValues(alpha: 0.8),
                  letterSpacing: 1.1,
                ),
              ),
              if (hasAdmin)
                loadSubTitleText(
                  fontSize: 10,
                  title: "Admin",
                  fontColor: Colors.white.withValues(alpha: 0.5),
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
    );
  }
}
