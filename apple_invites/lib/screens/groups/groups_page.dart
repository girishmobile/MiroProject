import 'package:apple_invites/core/common/app_group_row.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/screens/provider/group_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildFancyListView(context);
  }

  _buildFancyListView(BuildContext context) {
    final provider = Provider.of<GroupProvider>(context);

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 56.0),
          child: ListView.builder(
            itemCount: provider.listOfGroup.length,
            itemBuilder: (context, index) {
              final group = provider.listOfGroup[index];
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
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: _buildSearchBar(context: context),
        ),
      ],
    );
  }

  _buildSearchBar({required BuildContext context}) {
    return Container(
      color: Colors.transparent,
      height: 48,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          Expanded(
            child: AppTextfield(
              hintText: 'Search by name or number',
              onChanged: (val) {},
              prefixIcon: Icons.search,
            ),
          ),
          loadCircleIcon(
            icon: Icons.add,
            onTap:
                () => Navigator.pushNamed(context, RouteName.createGroupPage),
          ),
        ],
      ),
    );
  }
}
/**
 * HANDLE CALLBACK MESSAGE 
 * onTap: () async {
              final message = await Navigator.pushNamed(
                context,
                RouteName.createGroupPage,
              );
              if (message != null && message is String) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  appSnackMessenger(context: context, message: message);
                });
              }
            },
 */