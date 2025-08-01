import 'package:apple_invites/core/components/components.dart';
import 'package:flutter/material.dart';

class AppNavigationBar extends StatelessWidget {
  final String title;
  final double leftPadding;
  final double rightPadding;
  final double topPadding;
  final double bottomPadding;
  final bool isRightIcon;
  final IconData? rightIcons;
  final IconData? leftIcon;
  final VoidCallback? onLeftTap;
  final VoidCallback? onRightTap;
  const AppNavigationBar({
    super.key,
    this.title = "Redefine",
    this.leftPadding = 16,
    this.rightPadding = 16,
    this.topPadding = 0,
    this.bottomPadding = 0,
    this.isRightIcon = false,
    this.rightIcons,
    this.leftIcon,
    this.onLeftTap,
    this.onRightTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        leftPadding,
        topPadding,
        rightPadding,
        bottomPadding,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              loadCircleIcon(
                icon: leftIcon ?? Icons.arrow_back,
                iconSize: 20,
                radius: 18,
                onTap: onLeftTap,
              ),
              if (isRightIcon)
                loadCircleIcon(
                  icon: rightIcons,
                  iconSize: 20,
                  radius: 18,
                  onTap: onRightTap,
                ),
            ],
          ),
          loadTitleText(title: title),
        ],
      ),
    );
  }
}
