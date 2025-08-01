import 'package:apple_invites/core/common/app_event_row.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/screens/models/group_model.dart';
import 'package:apple_invites/screens/provider/group_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupInfoPage extends StatelessWidget {
  final String groupId;
  const GroupInfoPage({super.key, required this.groupId});

  @override
  Widget build(BuildContext context) {
    return Consumer<GroupProvider>(
      builder: (context, provider, _) {
        final updatingGroup = provider.findGroupById(groupId);
        return AppScaffold(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: ListView(
                  children:
                      updatingGroup != null
                          ? [
                            _buildGroupInfo(context, updatingGroup),
                            _buildGroupEvent(
                              context,
                              'Upcoming Events',
                              appEvent_5,
                            ),
                            _buildGroupEvent(
                              context,
                              'Past Events',
                              appEvent_4,
                            ),
                            _buildGroupAction(context),
                          ]
                          : [
                            loadEmptyView(
                              emptyIcon: Icons.group_outlined,
                              title: "NO Group Found",
                              message: "Group data is unavailable.",
                              buttonTitle: "GROUP NOT FOUND",
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                ),
              ),
              Positioned(
                child: AppNavigationBar(
                  title: "GROUP INFO",
                  onLeftTap: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _buildGroupInfo(BuildContext context, GroupModel updatedGroup) {
    final groupMember = updatedGroup.groupMembers;

    return loadGlassBackground(
      child: Column(
        children: [
          loadCircleImage(
            radius: 54,
            imageUrl: updatedGroup.imageUrl,
            text: updatedGroup.name,
            onTap: () => _showPhotoOrCamera(context),
          ),
          SizedBox(height: 8),
          _buildGroupTitle(context, updatedGroup),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              _buildItem(
                isIcon: false,
                title: "${groupMember.length}",
                subtile: 'Members',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteName.groupMembers,
                    arguments: groupId,
                  );
                },
              ),
              _buildItem(
                isIcon: false,
                title: "5",
                subtile: 'Events',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteName.groupEvents,
                    arguments: groupId,
                  );
                },
              ),
              _buildItem(
                isIcon: true,
                title: "Chat",
                subtile: 'Chat',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteName.groupMessagePage,
                    arguments: groupId,
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 12),
          loadSubTitleText(
            fontColor: Colors.white.withValues(alpha: 0.7),
            fontSize: 10,
            title: "Created Girish Chauhan 20-May-25",
          ),
        ],
      ),
    );
  }

  _buildGroupTitle(BuildContext context, GroupModel updatedGrp) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 30),
            loadTitleText(title: updatedGrp.name, fontSize: 18),
            SizedBox(width: 4),
            //Edit Button
            IconButton(
              style: IconButton.styleFrom(
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () async {
                final message = await Navigator.pushNamed(
                  context,
                  RouteName.updateGroup,
                  arguments: groupId,
                );
                if (message != null && message is String) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    appSnackMessenger(context: context, message: message);
                  });
                }
              },
              icon: Icon(Icons.edit_outlined, color: Colors.white),
            ),
          ],
        ),
        loadSubTitleText(title: updatedGrp.subTitle, fontSize: 12),
      ],
    );
  }

  _buildItem({
    required VoidCallback onTap,
    required String title,
    required String subtile,
    required bool isIcon,
  }) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isIcon
              ? Icon(Icons.wechat_outlined, color: Colors.white, size: 20)
              : loadTitleText(
                title: title,
                fontSize: 14,
                fontWight: FontWeight.w900,
                fontColor: Colors.white,
              ),
          loadSubTitleText(
            title: subtile,
            fontSize: 12,
            fontColor: Colors.white,
          ),
        ],
      ),
    );
  }

  _buildGroupEvent(BuildContext context, String title, String eventImage) {
    return loadGlassBackground(
      leftPadding: 8,
      bottomPadding: 8,
      rightPadding: 8,
      topPadding: 8,
      child: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 8),
            child: loadRowWithIcon(title: title),
          ),
          SizedBox(
            height: 290,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return AppEventRow(eventImageUrl: eventImage);
              },
              separatorBuilder: (_, _) => SizedBox(width: 4),
              itemCount: 9,
            ),
          ),
        ],
      ),
    );
  }

  _buildGroupAction(BuildContext context) {
    return loadGlassBackground(
      child: Column(
        spacing: 16,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          loadGlassButton(
            icon: Icons.person_add_alt,
            text: "Add members",
            onPress: () {
              Navigator.pushNamed(context, RouteName.contactPage);
            },
          ),
          loadGlassButton(
            icon: Icons.wechat_outlined,
            text: "Start group chat",
            onPress: () {
              Navigator.pushNamed(
                context,
                RouteName.groupMessagePage,
                arguments: groupId,
              );
            },
          ),
          loadGlassButton(
            icon: Icons.delete_outline,
            text: "Delete group",
            onPress: () {
              showAlertWithGlassEffect(
                context: context,
                title: "Delete group",
                message:
                    "Are you ABSOLUTELY sure you want to delete this group? This will remove this group for ALL users involved, not just yourself.",
                onConfirm: () {
                  context.read<GroupProvider>().removeGroup(groupId);
                  //Navigator.pop(context);
                  Navigator.of(context).popUntil(
                    (route) => route.settings.name == RouteName.mainPage,
                  );
                },
              );
            },
          ),
          loadGlassButton(
            icon: Icons.event_note_outlined,
            text: "Create event",
            onPress: () {
              Navigator.pushNamed(context, RouteName.createEventPage);
            },
          ),
        ],
      ),
    );
  }

  _showPhotoOrCamera(BuildContext context) {
    loadBottomSheetWithSafeArea(
      context: context,
      child: loadImageOrCamera(
        context,
        onPhotoTap: (imagePath) {
          if (imagePath.isNotEmpty) {
            context.read<GroupProvider>().updateImage(groupId, imagePath);

            appSnackMessenger(
              context: context,
              message: "Image updated successfully",
            );
          }
        },
        onCameraTap: (imagePath) {
          if (imagePath.isNotEmpty) {
            context.read<GroupProvider>().updateImage(groupId, imagePath);
            appSnackMessenger(
              context: context,
              message: "Image updated successfully",
            );
          }
        },
      ),
    );
  }
}
