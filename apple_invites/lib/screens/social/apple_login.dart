import 'package:apple_invites/core/common/app_checkbox.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_text_widget.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:flutter/material.dart';

class AppleLogin extends StatelessWidget {
  const AppleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyAppleLogin(context));
  }

  _buildFancyAppleLogin(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Center(child: _buildContentView(context)),
              ),
            ],
          ),
        ),
        AppNavigationBar(
          title: "LOGIN WITH AppleID",
          onLeftTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  _buildContentView(BuildContext context) {
    return loadGlassBackground(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            loadCircleIcon(
              icon: Icons.apple_outlined,
              iconSize: 44,
              radius: 36,
              iconColor: Colors.white.withValues(alpha: 0.7),
            ),
            AppTextfield(
              hintText: "Enter your email",
              prefixIcon: Icons.email_outlined,
            ),
            AppTextfield(hintText: "Password", prefixIcon: Icons.lock_outline),
            AppCheckbox(
              onTap: () {
                print("onTap pressed");
              },
            ),
            loadGlassButton(text: "Login with AppleID ", onPress: () {}),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteName.needMoreHelp);
              },
              child: Align(
                alignment: Alignment.topRight,
                child: AppTextWidget(
                  text: 'Need more help?',
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
