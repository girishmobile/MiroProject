import 'package:apple_invites/core/colors/colors.dart';
import 'package:apple_invites/core/common/app_profile_image.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      // physics: const BouncingScrollPhysics(),
      //padding: const EdgeInsets.all(8),
      children: [
        //Top container
        loadGlassBackground(child: _buildProfileView(context)),

        _buildListItem(
          title: "Edit Profile",
          subTitle: "Keep your profile up to date",
          iconName: Icons.edit,
          onTap: () {
            Navigator.pushNamed(context, RouteName.profilePage);
          },
        ),

        _buildListItem(
          title: "QR Code",
          subTitle: "Access your QR code",
          iconName: Icons.qr_code,
          onTap: () {
            Navigator.pushNamed(context, RouteName.qrcodePage);
          },
        ),
        _buildListItem(
          title: "Orders & Payment",
          subTitle: "Manage orders and payment",
          iconName: Icons.payment_sharp,
          onTap: () {
            Navigator.pushNamed(context, RouteName.orderAndPaymentPage);
          },
        ),
        _buildListItem(
          title: "Settings",
          subTitle: "Manage your settings",
          iconName: Icons.settings,
          onTap: () {
            Navigator.pushNamed(context, RouteName.settingPage);
          },
        ),
        _buildListItem(
          title: "Logout",
          subTitle: "Logout from your account",
          iconName: Icons.logout,
          onTap: () {
            showAlertWithGlassEffect(
              context: context,
              title: "Logout",
              message: "Are you sure you want to logout from your account?",
              onConfirm: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RouteName.loginPage,
                  (route) => false,
                );
              },
            );
          },
        ),
      ],
    );
  }

  _buildProfileView(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Row(
          spacing: 16,
          children: [
            AppProfileImage(imageUrl: profileImage, radius: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                loadTitleText(
                  title: "Girish Narivala",
                  fontSize: 18,
                  fontColor: Colors.white,
                ),
                loadSubTitleText(
                  title: "giri_narivala",
                  fontColor: Colors.white.withValues(alpha: 0.8),
                ),
              ],
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildItem(
              onTap: () {
                Navigator.pushNamed(context, RouteName.userEventPage);
              },
              title: "14",
              subtile: "Events",
            ),
            _buildItem(
              onTap: () {
                Navigator.pushNamed(context, RouteName.friendOfFriendsPage);
              },
              title: "219",
              subtile: "Friends",
            ),
            _buildItem(
              onTap: () {
                Navigator.pushNamed(context, RouteName.userGroupPage);
              },
              title: "04",
              subtile: "Groups",
            ),
          ],
        ),
      ],
    );
  }

  _buildItem({
    required VoidCallback onTap,
    required String title,
    required String subtile,
  }) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          loadTitleText(
            title: title,
            fontSize: 14,
            fontWight: FontWeight.w900,
            fontColor: Colors.white,
          ),
          loadSubTitleText(
            title: subtile,
            fontSize: 12,
            fontColor: Colors.white.withValues(alpha: 0.9),
          ),
        ],
      ),
    );
  }

  _buildListItem({
    required String title,
    required String subTitle,
    required IconData iconName,
    required VoidCallback? onTap,
  }) {
    return loadGlassBackground(
      leftPadding: 0,
      rightPadding: 0,
      bottomPadding: 0,
      topPadding: 0,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          splashColor: Colors.white.withValues(alpha: 0.1),
          highlightColor: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              spacing: 8,
              children: [
                loadCircleIcon(icon: iconName, iconSize: 20),
                Expanded(
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: fontRoboto,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.white,
                          letterSpacing: 1.1,
                        ),
                      ),
                      Text(
                        subTitle,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: fontRoboto,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.white.withValues(alpha: 0.8),
                          letterSpacing: 1.1,
                        ),
                      ),
                    ],
                  ),
                ),

                Icon(Icons.arrow_forward_ios, color: kBgCardColor, size: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
