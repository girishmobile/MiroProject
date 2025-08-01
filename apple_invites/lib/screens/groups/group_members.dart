import 'package:apple_invites/core/common/app_group_member_row.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_search_bar_with_title.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/screens/provider/group_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupMembers extends StatelessWidget {
  final String groupId;
  const GroupMembers({super.key, required this.groupId});

  @override
  Widget build(BuildContext context) {
    return Consumer<GroupProvider>(
      builder: (context, provider, _) {
        final group = provider.findGroupById(groupId);
        final hasGroup = group != null;
        final groupMembers = group?.groupMembers ?? [];

        return AppScaffold(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 104),
                child:
                    hasGroup && groupMembers.isNotEmpty
                        ? ListView.builder(
                          itemCount: groupMembers.length,
                          itemBuilder: (context, index) {
                            final member = groupMembers[index];
                            return loadGlassBackground(
                              child: AppGroupMemberRow(member: member),
                            );
                          },
                        )
                        : loadEmptyView(
                          emptyIcon: Icons.group_off_outlined,
                          title: "Data not found",
                          message:
                              "start by adding some group members to see them here.",
                          buttonTitle: "BACK TO PROFILE",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: AppSearchBarWithTitle(
                  title: "GROUP MEMBERS",
                  readOnly: !groupMembers.isNotEmpty,
                  onBackPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
/**
 * if (groupMembers.isEmpty) {
                  return loadEmptyView(
                    emptyIcon: Icons.group_off_outlined,
                    title: "No members Yet",
                    message: "No any member in this group.",
                    buttonTitle: "BACK TO PROFILE",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  );
                }

                final group = provider.findGroupById(groupId);
                if (group == null) {
                  return Center(child: Text("Something went wrong..."));
                }
                final groupMembers = group.groupMembers;
 */