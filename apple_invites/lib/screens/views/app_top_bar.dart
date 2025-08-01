import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/screens/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppTopBar extends StatelessWidget {
  const AppTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserProvider>().user;

    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: loadAssetImage(name: appLogo, fit: BoxFit.contain, height: 36),
        ),
        Container(
          color: Colors.transparent,
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 8,
              children: [
                loadCircleImage(
                  radius: 18,
                  text: user?.name ?? "?",
                  icon: null,
                  imageUrl: user?.imageUrl ?? profileImage,
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.profilePage);
                  },
                ),

                Spacer(),
                loadCircleIcon(
                  icon: Icons.public,
                  iconSize: 24,
                  radius: 18,
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.publicEventPage);
                  },
                ),
                loadCircleIcon(
                  icon: Icons.notifications,
                  iconSize: 24,
                  radius: 18,
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.notificationPage);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
