import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:flutter/material.dart';

class NeedMoreHelp extends StatelessWidget {
  const NeedMoreHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyNeedMoreHelp(context));
  }

  _buildFancyNeedMoreHelp(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48.0),
          child: Center(
            child: loadGlassBackground(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.help_outline,
                    size: 64,
                    color: Colors.white.withValues(alpha: 0.7),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Need More Help?",
                    style: TextStyle(
                      fontFamily: fontRoboto,
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Contact our support team for assistance.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: fontRoboto,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          child: AppNavigationBar(
            title: "Need More Help?",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
