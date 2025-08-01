import 'package:apple_invites/core/common/app_group_row.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/screens/provider/group_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeeAllGroup extends StatelessWidget {
  const SeeAllGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyGroupList(context));
  }

  _buildFancyGroupList(BuildContext context) {
    final provider = context.read<GroupProvider>();
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 104.0),
          child: ListView.builder(
            itemCount: provider.listOfGroup.length,
            itemBuilder: (context, index) {
              final group1 = provider.listOfGroup[index];
              return AppGroupRow(
                group: group1,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RouteName.groupInfoPage,
                    arguments: group1,
                  );
                },
              );
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
          title: "LIST OF GROUP(S)",
          onLeftTap: () {
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
