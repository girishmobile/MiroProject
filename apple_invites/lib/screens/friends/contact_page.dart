import 'dart:ui';

import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/screens/models/contact_model.dart';
import 'package:apple_invites/screens/provider/friend_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isBottomSafeArea: false,
      child: _buildFancyContactList(context),
    );
  }

  _buildFancyContactList(BuildContext context) {
    final provider = Provider.of<FriendProvider>(context);

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 104),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: provider.listOfContacts.length,
                  itemBuilder: (context, index) {
                    final contact = provider.listOfContacts[index];

                    return loadGlassBackground(
                      child: _buildFancyListItem(
                        contact: contact,
                        isSelected: provider.isSelected(contact.name),
                        onChanged: (value) {
                          provider.toggleSelection(
                            contact.name,
                            value ?? false,
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              Container(height: 108, color: Colors.transparent),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: _buildSearchBar(context: context),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: _buildBottomBarWithGlass(context),
        ),
      ],
    );
  }

  _buildFancyListItem({
    required ContactModel contact,
    required bool isSelected,
    required ValueChanged<bool?> onChanged,
  }) {
    return Row(
      spacing: 8,
      children: [
        loadCircleImage(
          text: contact.name,
          icon: null,
          imageUrl: contact.imageUrl,
        ),
        Expanded(
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                contact.name,
                style: TextStyle(
                  fontFamily: fontRoboto,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.white,
                  letterSpacing: 1.1,
                ),
              ),
              Text(
                contact.phoneNumber,
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
        Checkbox(
          value: isSelected,
          activeColor: Colors.white,
          checkColor: Colors.grey.withValues(alpha: 0.8),
          onChanged: onChanged,
          side: BorderSide(
            color: Colors.white.withValues(alpha: 0.9),
            width: 1.5,
          ),
        ),
      ],
    );
  }

  _buildSearchBar({required BuildContext context}) {
    final provider = context.read<FriendProvider>();
    return Column(
      spacing: 8,
      children: [
        AppNavigationBar(
          title: "ADD FROM CONTACT",
          onLeftTap: () {
            provider.clearSelection();
            Navigator.pop(context);
          },
        ),
        Container(
          color: Colors.transparent,
          height: 48,
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              Expanded(
                child: AppTextfield(
                  hintText: 'Search by name',
                  onChanged: (val) {},
                  prefixIcon: Icons.search,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildBottomBarWithGlass(BuildContext context) {
    final provider = context.read<FriendProvider>();
    return _buildGlassEffect(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          loadGlassButton(
            text: "ADD SELECTED FRIEND",
            onPress: () {
              provider.clearSelection();
              Navigator.pop(context);
            },
          ),
          // "Select contacts to add to your friend list.",
          Container(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
            child: Text(
              provider.selectedContacts.isNotEmpty
                  ? "${provider.selectedContactList.length} contacts selected"
                  : "Select contacts to add to your friend list",

              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.9),
                fontSize: 12,
                fontFamily: fontRoboto,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.02,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildGlassEffect({Widget? child}) {
    return ClipRRect(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white.withAlpha(40)),
            gradient: appGradient,
          ),
          child: child,
        ),
      ),
    );
  }
}
