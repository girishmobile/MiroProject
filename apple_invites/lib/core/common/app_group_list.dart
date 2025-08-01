import 'dart:ui';

import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/screens/models/group_model.dart';
import 'package:flutter/material.dart';

class AppGroupList extends StatelessWidget {
  const AppGroupList({super.key, required this.listOfGroup});

  final List<GroupModel> listOfGroup;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 2,
          children: [
            loadCircleIcon(
              icon: Icons.groups_outlined,
              iconColor: Colors.white,
              iconSize: 18,
              radius: 14,
            ),
            SizedBox(width: 4),
            Expanded(
              child: loadTitleText(
                title: "Groups(s)",
                fontColor: Colors.white,
                fontSize: 14,
                fontWight: FontWeight.w600,
              ),
            ),
            SizedBox(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.seeAllGroup);
                },
                child: loadSubTitleText(
                  title: "See All",
                  fontSize: 12,
                  fontColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 155,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            primary: false,
            itemCount: listOfGroup.length,
            itemBuilder: (context, index) {
              final item = listOfGroup[index];
              return _buildListItem(group: item);
            },
          ),
        ),
      ],
    );
  }

  _buildListItem({required GroupModel group}) {
    return _glassEffect(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                loadCircleImage(
                  imageUrl: group.imageUrl,
                  text: group.name,
                  radius: 22,
                ),
                Text(
                  group.name,
                  style: TextStyle(
                    fontFamily: fontRoboto,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: 1.02,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          loadGlassButton(
            fontSize: 12,
            horizontalPadding: 8,
            verticalPadding: 4,
            text: "invite",
            onPress: () {},
          ),
        ],
      ),
    );
  }

  _glassEffect({required Widget child}) {
    return ClipRRect(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(8),
          width: 110,
          margin: const EdgeInsets.only(right: 16),
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
          child: child,
        ),
      ),
    );
  }
}
