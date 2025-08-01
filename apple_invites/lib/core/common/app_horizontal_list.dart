import 'dart:ui';

import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/screens/models/guest_model.dart';
import 'package:flutter/material.dart';

class AppHorizontalList extends StatelessWidget {
  const AppHorizontalList({
    super.key,
    required this.title,
    this.icon,
    required this.guestList,
    this.height,
    this.isInvite,
    required this.onPressed,
  });

  final String title;
  final IconData? icon;
  final List<GuestModel> guestList;
  final double? height;
  final bool? isInvite;
  final VoidCallback onPressed;

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
            loadTitleText(
              title: "[${guestList.length}]",
              fontColor: Colors.white,
              fontSize: 14,
              fontWight: FontWeight.w500,
            ),
            SizedBox(width: 4),
            Expanded(
              child: loadTitleText(
                title: title,
                fontColor: Colors.white,
                fontSize: 14,
                fontWight: FontWeight.w500,
              ),
            ),
            SizedBox(
              child: TextButton(
                onPressed: onPressed,
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
          height: height ?? 130,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            primary: false,
            itemCount: guestList.length,
            itemBuilder: (context, index) {
              final guest = guestList[index];
              return isInvite == true
                  ? _buildInviteItem(
                    title: guest.name,
                    imageUrl: guest.imageUrl,
                  )
                  : _buildListItem(title: guest.name, imageUrl: guest.imageUrl);
            },
          ),
        ),
      ],
    );
  }

  _buildListItem({required String title, String? imageUrl}) {
    return _glassEffect(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          loadCircleImage(text: title, icon: null, imageUrl: imageUrl),
          Text(
            title,
            style: TextStyle(
              fontFamily: fontRoboto,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: 1.02,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  _buildInviteItem({required String title, String? imageUrl}) {
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
                //loadCircleIcon(text: title, radius: 22),
                loadCircleImage(text: title, icon: null, imageUrl: imageUrl),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: fontRoboto,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
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
            gradient: appGradient,
          ),
          child: child,
        ),
      ),
    );
  }
}
