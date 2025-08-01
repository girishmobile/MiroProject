import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_text_widget.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/common/app_toggle_button.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/screens/views/app_header_text.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool _isEmailSelected = true;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyForgot(context));
  }

  _buildFancyForgot(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: _buildContent(context),
        ),
        Positioned(
          child: AppNavigationBar(
            title: "FORGOT PASSWORD",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  _buildContent(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.list(
          children: [
            _loadForgotView(),
            SizedBox(height: 16),
            _buildBottomView(context),
          ],
        ),
      ],
    );
  }

  _loadForgotView() {
    return loadGlassBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          Icon(
            Icons.lock_outlined,
            size: 64,
            color: Colors.white.withValues(alpha: 0.7),
          ),
          AppHeaderText(
            title: 'Trouble logging in?',
            fontSize: 20,
            color: Colors.white,
          ),

          AppTextWidget(
            text:
                "Enter your email or phone number and we'll send you a link to get back into your account.",
            color: Colors.white.withValues(alpha: 0.7),
            fontSize: 14,
          ),
          SizedBox(height: 8),
          AppToggleButton(
            onToggleChanged: (value) {
              setState(() {
                _isEmailSelected = value;
              });
            },
          ),
          SizedBox(height: 8),
          _isEmailSelected
              ? AppTextfield(
                hintText: 'Email',
                prefixIcon: Icons.email_outlined,
              )
              : AppTextfield(
                hintText: 'Phone',
                prefixIcon: Icons.phone_iphone_outlined,
              ),
          AppTextWidget(
            text: "Enter your email address to reset your password.",
            color: Colors.white.withValues(alpha: 0.7),
            fontSize: 14,
          ),
          SizedBox(height: 4),

          loadGlassButton(text: "SEND RESET LINK", onPress: () {}),
          TextButton(
            onPressed: () {
              // Handle need more help action
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
    );
  }

  _buildBottomView(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            loadCircleIcon(
              icon: Icons.facebook_outlined,
              iconSize: 30,
              iconColor: Colors.white.withValues(alpha: 0.9),
            ),
            TextButton(
              onPressed: () {
                // Handle continue with Facebook action
              },
              child: AppTextWidget(
                text: 'Continue with Facebook',
                color: Colors.white.withValues(alpha: 0.9),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        loadCircleIcon(
          icon: Icons.arrow_back,
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

//   'Enter your email address to reset your password',
/**
 *  appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: kPrimaryColor,
        title: AppHeaderText(title: "Forgot Password"),
      ),
      body: 
 */
