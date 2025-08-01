import 'package:apple_invites/core/common/app_guest_row.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/screens/provider/guest_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AcceptedGuest extends StatelessWidget {
  const AcceptedGuest({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyAcceptedGuest(context));
  }

  _buildFancyAcceptedGuest(BuildContext context) {
    final provider = context.read<GuestProvider>();
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 104.0),
          child: ListView.builder(
            itemCount: provider.acceptedGuests.length,
            itemBuilder: (context, index) {
              final guest1 = provider.acceptedGuests[index];
              return loadGlassBackground(child: AppGuestRow(guest: guest1));
            },
          ),
        ),

        Positioned(
          left: 0,
          top: 0,
          right: 0,
          child: _buildSearchBarWithBack(context: context),
        ),
      ],
    );
  }

  _buildSearchBarWithBack({required BuildContext context}) {
    return Column(
      spacing: 8,
      children: [
        AppNavigationBar(
          title: "ACCEPTED GUEST LIST",
          onLeftTap: () {
            Navigator.pop(context);
          },
        ),
        Container(
          color: Colors.transparent,
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              Expanded(
                child: AppTextfield(
                  hintText: 'Search by guest name',
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
}
