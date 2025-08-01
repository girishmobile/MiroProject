import 'package:apple_invites/core/colors/colors.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/core/utility/date_time_helper.dart';
import 'package:apple_invites/screens/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    final user = context.read<UserProvider>().user;

    _nameController = TextEditingController(text: user?.name ?? '');
    _emailController = TextEditingController(text: user?.email ?? '');
    _phoneController = TextEditingController(text: user?.mobileNumber ?? '');
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, provider, _) {
        final user = provider.user;

        return AppScaffold(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: ListView(
                  children:
                      user != null
                          ? [
                            _buildEventPhoto(imageUrl: user.imageUrl),
                            _buildProfileDetails(),
                          ]
                          : [
                            loadEmptyView(
                              emptyIcon: Icons.person_off_outlined,
                              title: "User not found",
                              message:
                                  "Something went wrong. please try again...",
                              buttonTitle: "GO BACK",
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                ),
              ),
              Positioned(
                child: AppNavigationBar(
                  title: "MY PROFILE",
                  onLeftTap: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _buildEventPhoto({String? imageUrl}) {
    final isImageUrl = imageUrl != null && imageUrl.isNotEmpty;

    return loadGlassBackground(
      leftPadding: 0,
      rightPadding: 0,
      topPadding: 0,
      bottomPadding: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Container(
              color: Colors.white.withValues(alpha: 0.2),
              height: photoSize,
              child:
                  isImageUrl
                      ? loadNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                        height: photoSize,
                      )
                      : Center(
                        child: Text(
                          "No image",
                          style: TextStyle(
                            fontFamily: fontRoboto,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withValues(alpha: 0.7),
                          ),
                        ),
                      ),
            ),

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
        ),
      ),
    );
  }

  _showPhotoOrCamera(BuildContext context) {
    final provider = context.read<UserProvider>();
    loadBottomSheetWithSafeArea(
      context: context,
      child: loadImageOrCamera(
        context,
        onPhotoTap: (imagePath) {
          //provider.setProfileImage(imagePath);
          provider.updateImageUrl(imagePath);
        },
        onCameraTap: (imagePath) {
          //provider.setProfileImage(imagePath);
          provider.updateImageUrl(imagePath);
        },
      ),
    );
  }

  _buildProfileDetails() {
    return loadGlassBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          AppTextfield(hintText: 'Name', textController: _nameController),
          AppTextfield(hintText: 'Email', textController: _emailController),
          AppTextfield(
            hintText: 'Phone Number',
            textController: _phoneController,
          ),
          AppTextfield(
            readOnly: true,
            hintText: 'Birth(dd/mm/yyyy)',
            suffixIcon: Icons.arrow_drop_down,
            onTaped: () {
              showBirthdayCalendar(
                context,
                onDateSelected: (dateTime) {},
                firstDay: DateTime(1900),
              );
            },
          ),
          Text(
            'Make sure all your profile details are correct.\nAccurate information helps us serve you better.',
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 12,
              fontFamily: fontRoboto,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.1,
            ),
          ),
          loadGlassButton(
            text: "SAVE CHANGES",
            onPress: () {
              final newName = _nameController.text.trim();
              final newEmail = _emailController.text.trim();
              final newMobile = _phoneController.text.trim();
              final newBirthDay = "1-Feb-1990";

              if (newName.isEmpty && newEmail.isEmpty && newMobile.isEmpty) {
                appSnackMessenger(
                  context: context,
                  message: "All field are required so fill all details",
                );
                return;
              }
              context.read<UserProvider>().updateUserProfile(
                newName,
                newEmail,
                newMobile,
                newBirthDay,
              );
              appSnackMessenger(
                context: context,
                message: "Your profile is updated",
              );
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

/**
 * Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: loadAssetImage(name: appBackground, fit: BoxFit.cover),
          ),
          CustomScrollView(
            slivers: [
                (
                title: 'Profile',
                isEdited: true,
                imageUrl: profileImage,
              ),
              SliverFillRemaining(
                hasScrollBody: true,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: ListView(
                    shrinkWrap: true,
                    primary: false,
                    padding: EdgeInsets.zero,
                    children: [
                      AppTextfield(hintText: 'Name'),
                      SizedBox(height: 20),
                      AppTextfield(hintText: 'Email'),
                      SizedBox(height: 20),
                      AppTextfield(hintText: 'Phone Number'),
                      SizedBox(height: 20),
                      AppTextfield(hintText: 'Birthday'),
                      SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Make sure all your profile details are correct.\nAccurate information helps us serve you better.',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 12,
                            fontFamily: fontRoboto,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.1,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      loadGlassButton(text: "Save Changes", onPress: () {}),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    )
    (user != null && user.imageUrl?.isNotEmpty == true)
 */
