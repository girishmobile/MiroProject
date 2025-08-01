import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_profile_image.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyList(context));
  }

  _buildFancyList(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: ListView(children: [_buildGroupProfile(context)]),
        ),
        Positioned(
          child: AppNavigationBar(
            title: "CHANGE PASSWORD",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  _buildGroupProfile(BuildContext context) {
    return loadGlassBackground(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          loadCircleImage(radius: 54, text: "Sophia", imageUrl: hostImage),
          SizedBox(height: 8),
          loadRowWithIcon(
            title: "Sophia Abraham",
            textAlign: TextAlign.center,
            fontColor: Colors.white,
            fontSize: 18,
          ),
          loadSubTitleText(
            title: "+91 9558697986",
            fontColor: Colors.white.withValues(alpha: 0.7),
          ),
          SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: loadSubTitleText(
              fontSize: 12,
              title: "Last updated  09-June-25",
              fontColor: Colors.white.withValues(alpha: 0.7),
            ),
          ),
          SizedBox(height: 16),
          AppTextfield(hintText: "Current Password"),
          SizedBox(height: 16),
          AppTextfield(hintText: "New Password"),
          SizedBox(height: 16),
          AppTextfield(hintText: "Verify Password"),
          SizedBox(height: 8),
          _loadForgotPasswordButton(context),
          loadGlassButton(text: "UPDATE", onPress: () {}),
          SizedBox(height: 16),
          loadSubTitleText(
            textAlign: TextAlign.center,
            fontColor: Colors.white.withValues(alpha: 0.7),
            fontSize: 12,
            title:
                "Make your password strong by including uppercase letters, lowercase letters, numbers, and special character",
          ),
        ],
      ),
    );
  }

  _loadForgotPasswordButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          customGlassDialogWithChild(
            context: context,
            child: _forgotAlertBox(context),
          );
        },
        child: Text(
          "Forgot Password",
          style: TextStyle(
            color: Colors.white,
            fontFamily: fontRoboto,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.02,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  _forgotAlertBox(BuildContext context) {
    return Column(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        loadTitleText(title: "Text Message Sent"),
        loadSubTitleText(
          textAlign: TextAlign.left,
          fontColor: Colors.white.withValues(alpha: 0.7),
          title:
              "We sent a text message to +91 9558697986 with a link to reset your password.",
        ),
        SizedBox(height: 1),
        loadGlassButton(
          text: "OK",
          onPress: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
