import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/screens/models/contact_model.dart';
import 'package:apple_invites/screens/models/group_member_model.dart';
import 'package:apple_invites/screens/models/group_model.dart';
import 'package:apple_invites/screens/models/user_model.dart';
import 'package:apple_invites/screens/provider/group_provider.dart';
import 'package:apple_invites/screens/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  late final TextEditingController _nameController;
  late final TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 48),
            child: ListView(
              children: [
                _buildPhotoSection(context),
                _buildTextSection(context),
              ],
            ),
          ),
          Positioned(
            child: AppNavigationBar(
              title: "CREATE GROUP",
              onLeftTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  _buildTextSection(BuildContext context) {
    final provider = context.read<GroupProvider>();
    final userProvider = context.read<UserProvider>();
    final user = userProvider.user;

    return loadGlassBackground(
      child: Column(
        spacing: 16,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppTextfield(hintText: "Name", textController: _nameController),
          loadMultiLineTextField(
            hintText: "Message (Optional)",
            textController: _descController,
          ),
          loadGlassButton(
            text: "CREATE GROUP",
            onPress: () {
              final newName = _nameController.text.trim();
              final newMessage = _descController.text.trim();
              if (newName.isEmpty) {
                appSnackMessenger(
                  context: context,
                  message: "Group name cannot be empty",
                );
                return;
              }
              if (user == null) {
                appSnackMessenger(
                  context: context,
                  message: "User not found. Please try again.",
                );
                return;
              }
              final newGroup = GroupModel(
                name: newName,
                isNetwork: false,
                subTitle: newMessage,
                imageUrl: provider.imageUrl,
                groupMembers: [
                  GroupMemberModel(
                    name: user.name,
                    phone: user.mobileNumber,
                    email: user.email,
                    imageUrl: user.imageUrl,
                    type: 'Admin',
                  ),
                ],
              );
              provider.insertNewGroup(0, newGroup);
              Navigator.pop(context, "New group added");
            },
          ),
          loadSubTitleText(
            fontColor: Colors.white.withValues(alpha: 0.7),
            fontSize: 12,
            title:
                "Creating a Group lets you chat, share and collaborate with multiple people at once",
          ),
        ],
      ),
    );
  }

  _buildPhotoSection(BuildContext context) {
    return Consumer<GroupProvider>(
      builder: (context, provider, _) {
        final isImageUrl = provider.imageUrl;
        return loadGlassBackground(
          leftPadding: 0,
          rightPadding: 0,
          bottomPadding: 0,
          topPadding: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              color: Colors.transparent,
              height: photoSize,
              width: double.infinity,
              child:
                  isImageUrl != null && isImageUrl.isNotEmpty
                      ? Stack(
                        fit: StackFit.expand,
                        children: [
                          loadNetworkImage(imageUrl: isImageUrl),
                          Positioned(
                            right: 5,
                            bottom: 5,
                            child: loadCircleIcon(
                              radius: 18,
                              iconSize: 18,
                              icon: Icons.camera_alt_outlined,
                              backgroundColor: Colors.black.withValues(
                                alpha: 0.6,
                              ),
                              onTap: () => _showPhotoOrCamera(context),
                            ),
                          ),
                        ],
                      )
                      : Column(
                        spacing: 12,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          loadCircleIcon(
                            iconSize: 36,
                            radius: 36,
                            icon: Icons.camera_alt_outlined,
                            iconColor: Colors.white.withValues(alpha: 0.7),
                            onTap: () => _showPhotoOrCamera(context),
                          ),
                          loadTitleText(
                            fontSize: 14,
                            fontColor: Colors.white.withValues(alpha: 0.7),
                            title: "Choose from Library or Camera",
                          ),
                        ],
                      ),
            ),
          ),
        );
      },
    );
  }

  _showPhotoOrCamera(BuildContext context) {
    loadBottomSheetWithSafeArea(
      context: context,
      child: loadImageOrCamera(
        context,
        onPhotoTap: (imagePath) {
          if (imagePath.isNotEmpty) {
            context.read<GroupProvider>().setImageUrl(imagePath);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Image updated successfully")),
            );
          }
        },
        onCameraTap: (imagePath) {
          if (imagePath.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Image updated successfully")),
            );
          }
        },
      ),
    );
  }
}
