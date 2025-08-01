import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/screens/models/group_model.dart';
import 'package:apple_invites/screens/provider/group_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateGroup extends StatefulWidget {
  final String groupId;

  const UpdateGroup({super.key, required this.groupId});

  @override
  State<UpdateGroup> createState() => _UpdateGroupState();
}

class _UpdateGroupState extends State<UpdateGroup> {
  late final TextEditingController _nameController;
  late final TextEditingController _descController;
  GroupModel? group;
  String? oldImageUrl;

  @override
  void initState() {
    super.initState();
    group = context.read<GroupProvider>().findGroupById(widget.groupId);
    oldImageUrl = group?.imageUrl ?? '';
    _nameController = TextEditingController(text: group?.name ?? '');
    _descController = TextEditingController(text: group?.subTitle ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GroupProvider>(
      builder: (context, provider, _) {
        final updatingGroup = provider.findGroupById(widget.groupId);
        return AppScaffold(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: ListView(
                  children:
                      updatingGroup != null
                          ? [
                            _buildPhotoSection(
                              imageUrl: updatingGroup.imageUrl,
                            ),
                            _buildTextSection(),
                          ]
                          : [
                            loadEmptyView(
                              emptyIcon: Icons.group_outlined,
                              title: "NO GROUP FOUND",
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
                  title: "UPDATE GROUP",
                  onLeftTap: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _buildPhotoSection({String? imageUrl}) {
    final isImageUrl = imageUrl != null && imageUrl.isNotEmpty;
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
              isImageUrl
                  ? Stack(
                    fit: StackFit.expand,
                    children: [
                      loadNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover),
                      Positioned(
                        right: 5,
                        bottom: 5,
                        child: loadCircleIcon(
                          radius: 18,
                          iconSize: 18,
                          icon: Icons.camera_alt_outlined,
                          backgroundColor: Colors.black.withValues(alpha: 0.6),
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
  }

  _buildTextSection() {
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
            text: "UPDATE GROUP",
            onPress: () {
              final newName = _nameController.text.trim();
              final newMessage = _descController.text.trim();
              final group = context.read<GroupProvider>().findGroupById(
                widget.groupId,
              );
              if (group == null) {
                appSnackMessenger(
                  context: context,
                  message: "Something went wrong...",
                );
                return;
              }
              //Check if any changes were made

              final oldMessage = group.subTitle?.trim() ?? "";

              final hasNameChanged = newName != group.name;
              final hasMessageChanged = newMessage != oldMessage;
              final currentImageUrl = group.imageUrl ?? '';
              final hasImageChanged = currentImageUrl != oldImageUrl;

              if (newName.isEmpty) {
                appSnackMessenger(
                  context: context,
                  message: "Group name cannot be empty",
                );
                return;
              }

              if (hasImageChanged && !hasNameChanged && !hasMessageChanged) {
                Navigator.pop(context, "Group image changed");
                return;
              }
              //!hasImageChanged &&
              if (!hasImageChanged && !hasNameChanged && !hasMessageChanged) {
                appSnackMessenger(
                  context: context,
                  message: "No changes to update",
                );
                Navigator.pop(context);
                return;
              }
              if (newName.isEmpty) {
                appSnackMessenger(
                  context: context,
                  message: "Group name cannot be empty",
                );
                return;
              } else {
                // ✅ Apply update
                context.read<GroupProvider>().updateGroup(
                  widget.groupId,
                  newName,
                  newMessage,
                );
                Navigator.pop(context, "Group is updated");
              }
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

  _showPhotoOrCamera(BuildContext context) {
    loadBottomSheetWithSafeArea(
      context: context,
      child: loadImageOrCamera(
        context,
        onPhotoTap: (imagePath) {
          if (imagePath.isNotEmpty) {
            context.read<GroupProvider>().updateImage(
              widget.groupId,
              imagePath,
            );

            appSnackMessenger(
              context: context,
              message: "Image updated successfully",
            );
          }
        },
        onCameraTap: (imagePath) {
          if (imagePath.isNotEmpty) {
            context.read<GroupProvider>().updateImage(
              widget.groupId,
              imagePath,
            );
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
/**
 * on State<>
 * bool _hasChanges = false;
 * on Init state
 * 
 *  // _nameController.addListener(_checkForChanges);
    // _descController.addListener(_checkForChanges);
 //FOR 
    // if (!_hasChanges) return;
      // context.read<GroupProvider>().updateGroup(
      //   widget.groupId,
      //   _nameController.text.trim(),
      //   _descController.text.trim(),
      // );
    void _checkForChanges() {
    final nameChanged = _nameController.text.trim() != group?.name;
    final messageChanged = _descController.text.trim() != group?.subTitle;

    setState(() {
      _hasChanges = nameChanged || messageChanged;
    });
  }
  ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "",
                      style: TextStyle(
                        fontFamily: fontRoboto,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
 */