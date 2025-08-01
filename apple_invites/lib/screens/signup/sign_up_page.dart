import 'package:apple_invites/core/colors/colors.dart';
import 'package:apple_invites/core/common/app_checkbox.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_text_widget.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancySingUp(context));
  }

  _buildFancySingUp(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: CustomScrollView(
            slivers: [
              SliverList.list(
                children: [
                  loadGlassBackground(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 16,
                      children: [
                        AppTextWidget(
                          text: 'Create an account!',
                          textStyle: TextStyle(
                            fontFamily: fontRoboto,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            letterSpacing: 1.1,
                            color: kPrimaryColor,
                          ),
                          alignment: TextAlign.left,
                        ),
                        AppTextfield(
                          hintText: 'Username',
                          prefixIcon: Icons.person_outline,
                        ),
                        AppTextfield(
                          hintText: 'Email',
                          prefixIcon: Icons.email_outlined,
                        ),
                        AppTextfield(
                          hintText: 'Phone Number',
                          prefixIcon: Icons.phone_iphone_outlined,
                        ),
                        AppTextfield(
                          hintText: 'Birthdate',
                          prefixIcon: Icons.calendar_today_outlined,
                        ),
                        AppTextfield(
                          hintText: 'Password',
                          prefixIcon: Icons.lock_outline,
                        ),
                        AppTextfield(
                          hintText: 'Confirm Password',
                          prefixIcon: Icons.lock_outline,
                        ),

                        AppCheckbox(
                          onTap: () {
                            print("onTap pressed");
                          },
                        ),

                        loadGlassButton(
                          text: "SIGN UP",
                          onPress: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              RouteName.mainPage,
                              (route) => false,
                            );
                          },
                        ),
                        AppTextWidget(
                          fontSize: 12,
                          color: Colors.white.withValues(alpha: 0.7),
                          text:
                              "You'll receive an email confirmation for you to verify your account.",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildSocialIcon(),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppNavigationBar(
            title: "SIGN UP",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  _buildSocialIcon() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 16,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            "Or login with",
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontFamily: fontRoboto,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.1,
              fontSize: 14,
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 45,
          children: [
            loadCircleIcon(
              icon: Icons.apple,
              iconColor: Colors.white.withValues(alpha: 0.7),
              iconSize: 30,
              radius: 24,
            ),
            loadCircleIcon(
              icon: Icons.facebook,
              iconColor: Colors.white.withValues(alpha: 0.7),
              iconSize: 30,
              radius: 24,
            ),
            loadCircleIcon(
              icon: Icons.g_mobiledata,
              iconColor: Colors.white.withValues(alpha: 0.7),
              iconSize: 30,
              radius: 24,
            ),
          ],
        ),
      ],
    );
  }
}
