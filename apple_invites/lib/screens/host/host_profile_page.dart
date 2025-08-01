import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_profile_image.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:flutter/material.dart';

class HostProfilePage extends StatelessWidget {
  const HostProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyProfile(context));
  }

  _buildFancyProfile(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: CustomScrollView(
            slivers: [
              SliverList.list(
                children: [
                  _buildProfileImage(context),
                  _buildContactUs(context),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          child: AppNavigationBar(
            title: "HOST PROFILE",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  _buildProfileImage(BuildContext context) {
    return loadGlassBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppProfileImage(imageUrl: hostImage, radius: 54),
          const SizedBox(height: 10),
          loadRowWithIcon(
            title: "John Doe",
            textAlign: TextAlign.center,
            fontColor: Colors.white,
          ),

          loadSubTitleText(
            title: "johndeo1999@gmail.com",
            fontColor: Colors.white.withValues(alpha: 0.8),
          ),
          loadSubTitleText(
            title: "+1 234 567 890",
            fontColor: Colors.white.withValues(alpha: 0.8),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 48,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                loadCircleIcon(
                  icon: Icons.call,
                  radius: 18,
                  iconSize: 18,
                  onTap: () {},
                ),
                loadCircleIcon(
                  icon: Icons.message_outlined,
                  radius: 18,
                  iconSize: 18,
                  onTap: () {},
                ),
                loadCircleIcon(
                  icon: Icons.email_outlined,
                  radius: 18,
                  iconSize: 18,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildContactUs(BuildContext context) {
    return loadGlassBackground(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          loadTitleText(
            title: "CONTACT US",
            fontColor: Colors.white,
            fontSize: 18,
            fontWight: FontWeight.w700,
          ),
          loadSubTitleText(
            title:
                "If you have any questions or need assistance, feel free to reach out to us.",
            fontColor: Colors.white.withValues(alpha: 0.8),
            fontSize: 14,
          ),
          AppTextfield(hintText: "Summary"),
          loadMultiLineTextField(),
          loadGlassButton(
            text: "SUBMIT",
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
