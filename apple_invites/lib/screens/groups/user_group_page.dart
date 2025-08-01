import 'dart:math';

import 'package:apple_invites/core/common/app_group_row.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/screens/models/group_model.dart';
import 'package:apple_invites/screens/provider/group_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserGroupPage extends StatelessWidget {
  const UserGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<GroupProvider>();

    List<GroupModel> getRandomGroups(List<GroupModel> list) {
      final random = Random();
      final shuffledList = List<GroupModel>.from(list)..shuffle();
      final count = 4; //+ random.nextInt(2); // Random number: 4 or 5
      return shuffledList.take(count).toList();
    }

    final List<GroupModel> randomGroup = getRandomGroups(provider.listOfGroup);

    return AppScaffold(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 104),
            child: ListView.builder(
              itemCount: randomGroup.length,
              itemBuilder: (context, index) {
                final group = randomGroup[index];
                return AppGroupRow(
                  group: group,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RouteName.groupInfoPage,
                      arguments: group.id,
                    );
                  },
                );
              },
            ),
          ),
          Positioned(child: _buildSearchBarWithTitle(context)),
        ],
      ),
    );
  }

  _buildSearchBarWithTitle(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        AppNavigationBar(
          title: "USER'S GROUP",
          onLeftTap: () {
            Navigator.pop(context);
          },
        ),
        Container(
          height: 48,
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              Expanded(
                child: AppTextfield(
                  hintText: 'Search by group name',
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
