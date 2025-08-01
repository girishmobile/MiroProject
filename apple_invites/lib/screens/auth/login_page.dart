import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/screens/models/user_model.dart';
import 'package:apple_invites/screens/provider/user_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildLoginView(context));
  }

  _buildLoginView(BuildContext context) {
    final provider = context.read<UserProvider>();
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 220,
                pinned: false,
                floating: false,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  background: Center(
                    child: loadAssetImage(name: appLogo, height: 54),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  spacing: 24,
                  children: [
                    loadGlassBackground(
                      leftMargin: 16,
                      rightMargin: 16,
                      child: Column(
                        children: [
                          loadTitleText(title: "Welcome Back!", fontSize: 24),
                          SizedBox(height: 16),
                          AppTextfield(
                            hintText: "Enter your email",
                            prefixIcon: Icons.email_outlined,
                          ),
                          SizedBox(height: 16),
                          AppTextfield(
                            hintText: "Password",
                            prefixIcon: Icons.lock_outline,
                          ),
                          _loadForgotPasswordButton(context),
                          SizedBox(height: 8),
                          loadGlassButton(
                            text: "Login",
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            onPress: () {
                              provider.setUser(
                                UserModel(
                                  name: "Emily Jackson",
                                  email: "emilyjackson@example.com",
                                  mobileNumber: "+1 9558697986",
                                  imageUrl:
                                      "https://images.unsplash.com/photo-1572431862804-10af7b9c2830?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTAzN3x8cHJvZmlsZSUyMGdpcmx8ZW58MHwyfDB8fHww",
                                  dateOfBirth: "01-Feb-1990",
                                ),
                              );
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                RouteName.mainPage,
                                (route) => false,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Or login with",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: fontRoboto,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    _buildSocialIcon(context),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: RichText(
            text: TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                fontFamily: fontRoboto,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.02,
              ),
              children: [
                TextSpan(
                  text: 'Sign Up',
                  recognizer:
                      TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, RouteName.signupPage);
                        },
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: fontRoboto,
                    fontWeight: FontWeight.w600,

                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _loadForgotPasswordButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteName.forgotPassword);
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

  _buildSocialIcon(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 24,
      children: [
        loadCircleIcon(
          icon: Icons.apple,
          iconColor: Colors.white.withValues(alpha: 0.7),
          iconSize: 30,
          radius: 24,
          onTap: () {
            Navigator.pushNamed(context, RouteName.appleLogin);
          },
        ),
        loadCircleIcon(
          icon: Icons.facebook,
          iconSize: 30,
          radius: 24,
          iconColor: Colors.white.withValues(alpha: 0.7),
          onTap: () {
            Navigator.pushNamed(context, RouteName.facebookLogin);
          },
        ),
        loadCircleIcon(
          icon: Icons.g_mobiledata,
          iconSize: 40,
          radius: 24,
          iconColor: Colors.white.withValues(alpha: 0.7),
          onTap: () {
            Navigator.pushNamed(context, RouteName.googleLogin);
          },
        ),
      ],
    );
  }
}
