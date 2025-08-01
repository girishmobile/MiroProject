import 'package:apple_invites/core/colors/colors.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:flutter/material.dart';

class AddFriendByPhone extends StatelessWidget {
  const AddFriendByPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyAddFriend(context));
  }

  _buildFriendBox() {
    return ListView(
      children: [
        loadGlassBackground(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16,
            children: [
              loadRowWithIcon(
                title: 'Add a friend',
                iconName: Icons.person_add_alt_1_rounded,
              ),
              _buildTextLabel(
                title:
                    "Please enter the name and phone number of the person you would like to add.",
              ),
              AppTextfield(hintText: 'name'),
              AppTextfield(hintText: 'Phone number'),
              _buildTextLabel(title: "Make new friends with just one tap!"),
              loadGlassButton(text: 'ADD A FRIEND', onPress: () {}),
            ],
          ),
        ),
      ],
    );
  }

  _buildFancyAddFriend(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: _buildFriendBox(),
        ),
        AppNavigationBar(
          title: 'ADD FRIEND',
          onLeftTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  _buildTextLabel({required String title}) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: fontRoboto,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: kPrimaryColor,
        letterSpacing: 1.1,
      ),
    );
  }
}
